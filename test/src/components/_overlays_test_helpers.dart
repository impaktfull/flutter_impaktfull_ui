import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

/// Shared helpers for the tests of the pickers & overlays components.

/// Pumps an [ImpaktfullUiApp] with [home] and returns a context below the
/// navigator of the app (to show modals, bottom sheets, ...).
Future<BuildContext> pumpOverlayApp(
  WidgetTester tester, {
  Widget? home,
  SnackyController? snackyController,
}) async {
  late BuildContext appContext;
  await tester.pumpWidget(
    ImpaktfullUiApp(
      showDebugFlag: false,
      title: 'test',
      snackyController: snackyController,
      home: Builder(
        builder: (context) {
          appContext = context;
          return home ?? const SizedBox.expand();
        },
      ),
    ),
  );
  await tester.pumpAndSettle();
  return appContext;
}

/// Sets the size of the test view and resets it at the end of the test.
void setOverlayTestViewSize(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

/// Taps [finder] and waits until all animations are done.
Future<void> tapAndSettle(WidgetTester tester, Finder finder) async {
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

/// Taps [finder] and settles, to be used as `whilePerforming` of a golden test.
Interaction tapAndSettleInteraction(Finder finder) => (tester) async {
      await tapAndSettle(tester, finder);
      return null;
    };

/// Same setup as `runComponentTest` of `test/util/golden_test_util.dart`, but
/// for one scenario that needs an interaction (e.g. opening a tooltip or
/// switching the view of a picker) before the screenshot is taken.
///
/// Pass a [size] when the scenario shows something in the overlay of the app
/// (tooltips, notifications, ...): the overlay needs a bounded size.
void runOverlayGoldenTest({
  required String fileName,
  required Widget Function() builder,
  Size? size,
  Interaction? whilePerforming,
  PumpAction pumpBeforeTest = onlyPumpAndSettle,
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
        pumpBeforeTest: pumpBeforeTest,
        whilePerforming: whilePerforming,
        builder: () {
          final child = builder();
          final app = child is ImpaktfullUiApp
              ? child
              : ImpaktfullUiApp(
                  showDebugFlag: false,
                  title: 'impaktfull app',
                  home: ImpaktfullUiContainer(
                    color: Colors.transparent,
                    child: child,
                  ),
                );
          if (size == null) return app;
          return SizedBox.fromSize(size: size, child: app);
        },
      );
    },
  );
}
