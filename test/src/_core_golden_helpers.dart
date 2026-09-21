// The golden helpers of `_core_test_helpers.dart`. They use alchemist,
// which does not compile for the web, so only `*_golden_test.dart` files
// import this file (tool/test_web.sh leaves those out). The other helpers are
// in `_core_test_helpers.dart`, which this file exports.

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '_core_test_helpers.dart';

export '_core_test_helpers.dart';

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
