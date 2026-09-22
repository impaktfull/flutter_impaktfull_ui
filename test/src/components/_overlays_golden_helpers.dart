// The golden helpers of `_overlays_test_helpers.dart`. They use alchemist,
// which does not compile for the web, so only `*_golden_test.dart` files
// import this file (tool/test_web.sh leaves those out). The other helpers are
// in `_overlays_test_helpers.dart`, which this file exports.

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '_overlays_test_helpers.dart';

export '_overlays_test_helpers.dart';

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
