import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import 'font_loader.dart';
import 'golden_test_variant.dart';
import 'shipped_themes.dart';

void setupComponentTest() async {
  await loadImpaktfullUiFonts();
}

/// A golden of a component, once for every theme this package ships.
///
/// `<fileName>.png` is the default theme in light, as it always was, and next
/// to it are `<fileName>_dark.png` and one per design system theme in both
/// brightnesses (`shippedThemes`). A component that is only ever looked at in
/// the default theme is how a theme quietly breaks, so this is the default.
///
/// Pass [theme] for a golden of one specific theme (a test of the tokens of a
/// theme), or `perTheme: false` for a test that builds an
/// `ImpaktfullUiApp` with a theme of its own: both then render one golden,
/// with the name they always had.
Future<void> runComponentTest({
  required String fileName,
  required List<GoldenTest> Function() goldenTests,
  ImpaktfullUiTheme? theme,
  ImpaktfullUiTestFontLoader? fontLoader,
  int columns = 1,
  PumpAction? pumpBeforeTest,
  bool perTheme = true,
}) async {
  if (theme != null || !perTheme) {
    _runComponentTest(
      fileName: fileName,
      description: 'renders correctly',
      goldenTests: goldenTests,
      theme: theme,
      columns: columns,
      pumpBeforeTest: pumpBeforeTest,
    );
    return;
  }
  for (final shipped in shippedThemes) {
    // Not awaited: every golden has to be registered before the first test
    // runs, and `setUp` of a later one would land after it has begun.
    _runComponentTest(
      fileName: '$fileName${shipped.fileSuffix}',
      description: 'renders correctly (${shipped.description})',
      goldenTests: goldenTests,
      theme: shipped.build(),
      columns: columns,
      pumpBeforeTest: pumpBeforeTest,
    );
  }
}

void _runComponentTest({
  required String fileName,
  required String description,
  required List<GoldenTest> Function() goldenTests,
  required ImpaktfullUiTheme? theme,
  required int columns,
  required PumpAction? pumpBeforeTest,
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
        description,
        fileName: fileName,
        pumpBeforeTest: pumpBeforeTest ?? onlyPumpAndSettle,
        builder: () => ImpaktfullUiAutoLayout.vertical(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GoldenTestGroup(
              columns: columns,
              children: goldenTests()
                  .map(
                    (e) => Builder(builder: (context) {
                      final child = e.child;
                      if (child is ImpaktfullUiApp) {
                        return child;
                      }
                      return ImpaktfullUiApp(
                        showDebugFlag: false,
                        title: 'impaktfull app',
                        // Null for almost every golden: the app then uses the
                        // default theme of the package.
                        impaktfullUiTheme: theme,
                        home: ImpaktfullUiContainer(
                          // The canvas of the theme behind the component, so
                          // a golden of a dark theme is readable. The default
                          // theme (`theme` is null) keeps the transparent
                          // background its goldens always had.
                          color: theme?.colors.canvas ?? Colors.transparent,
                          child: child,
                        ),
                      );
                    }),
                  )
                  .toList(),
            ),
          ],
        ),
      );
    },
  );
}
