import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

/// The logical screen size of a phone, used by the building block goldens.
const phoneSize = Size(390, 844);

/// The logical screen size of a desktop, used by the building block goldens.
const desktopSize = Size(1280, 800);

/// Pumps [home] in an [ImpaktfullUiApp] and waits for the animations to
/// settle.
Future<void> pumpImpaktfullUiApp(
  WidgetTester tester,
  Widget home, {
  ImpaktfullUiTheme? theme,
  ImpaktfullUiLocalizations localizations = const ImpaktfullUiLocalizations(),
  List<ImpaktfullUiOverridableComponent<Widget, ImpaktfullUiComponentTheme>>
      overrideComponents = const [],
  List<NavigatorObserver> navigatorObservers = const [],
  Size? screenSize,
  bool settle = true,
}) async {
  if (screenSize != null) {
    tester.view.physicalSize = screenSize;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
  }
  await tester.pumpWidget(
    ImpaktfullUiApp(
      showDebugFlag: false,
      title: 'impaktfull app',
      impaktfullUiTheme: theme,
      localizations: localizations,
      overrideComponents: overrideComponents,
      navigatorObservers: navigatorObservers,
      home: home,
    ),
  );
  if (settle) {
    await tester.pumpAndSettle();
  } else {
    await tester.pump();
  }
}

/// A golden test of a full screen (e.g. a building block), rendered at
/// [phoneSize] and [desktopSize] next to each other.
///
/// Building blocks without their own screen are hosted in an
/// [ImpaktfullUiScreen], like apps (and the example app) do. Pass
/// `wrapInScreen: false` for a widget that is a screen itself.
///
/// Uses the same alchemist config as `test/util/golden_test_util.dart`.
void runScreenGoldenTest({
  required String fileName,
  required Widget Function() builder,
  bool wrapInScreen = true,
  PumpAction? pumpBeforeTest,
}) {
  AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      platformGoldensConfig: PlatformGoldensConfig(
        platforms: {HostPlatform.macOS},
      ),
      goldenTestTheme: GoldenTestTheme(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        borderColor: const Color.fromARGB(255, 0, 0, 0),
        nameTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    ),
    run: () {
      goldenTest(
        'renders correctly',
        fileName: fileName,
        pumpBeforeTest: pumpBeforeTest ?? onlyPumpAndSettle,
        builder: () => GoldenTestGroup(
          columns: 2,
          children: [
            for (final entry in {
              'phone': phoneSize,
              'desktop': desktopSize,
            }.entries)
              GoldenTestScenario(
                name: entry.key,
                child: SizedBox.fromSize(
                  size: entry.value,
                  child: MediaQuery(
                    data: MediaQueryData(size: entry.value),
                    child: ImpaktfullUiApp(
                      showDebugFlag: false,
                      title: 'impaktfull app',
                      home: wrapInScreen
                          ? ImpaktfullUiScreen(child: builder())
                          : builder(),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    },
  );
}
