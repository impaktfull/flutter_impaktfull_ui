// The golden helpers of `_data_display_test_helpers.dart`. They use alchemist,
// which does not compile for the web, so only `*_golden_test.dart` files
// import this file (tool/test_web.sh leaves those out). The other helpers are
// in `_data_display_test_helpers.dart`, which this file exports.

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../util/golden_test_variant.dart';

export '_data_display_test_helpers.dart';

/// Same as `runComponentTest` of `test/util/golden_test_util.dart`, but with a
/// custom [pumpBeforeTest]: for components with a never ending animation
/// (e.g. an indeterminate [CircularProgressIndicator]) that should be captured
/// at a fixed moment instead of at the very first frame.
void runComponentTestWithPump({
  required String fileName,
  required List<GoldenTest> Function() goldenTests,
  required PumpAction pumpBeforeTest,
  int columns = 1,
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
        builder: () => GoldenTestGroup(
          columns: columns,
          children: goldenTests()
              .map(
                (e) => ImpaktfullUiApp(
                  showDebugFlag: false,
                  title: 'impaktfull app',
                  home: ImpaktfullUiContainer(
                    color: Colors.transparent,
                    child: e.child,
                  ),
                ),
              )
              .toList(),
        ),
      );
    },
  );
}

/// Loads svg, pixel and lottie assets before a golden is taken: they are
/// decoded asynchronously, which does not happen in the fake async zone of a
/// widget test.
Future<void> pumpAssets(WidgetTester tester) async {
  await precacheImages(tester);
  for (var i = 0; i < 3; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 50)),
    );
    await tester.pump();
  }
}
