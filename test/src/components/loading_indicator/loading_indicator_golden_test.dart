import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  final defaultTheme =
      ImpaktfullUiTheme.getDefault().components.loadingIndicator;
  // Without a lottie file the loading indicator falls back to a
  // CircularProgressIndicator.
  final circularTheme = ImpaktfullUiLoadingIndicatorTheme(
    assets: const ImpaktfullUiLoadingIndicatorAssetsTheme(lottie: null),
    colors: defaultTheme.colors,
    dimens: defaultTheme.dimens,
  );

  // The indeterminate spinner never settles: captured after 500ms.
  runComponentTestWithPump(
    fileName: 'impaktfull_ui_loading_indicator_circular',
    columns: 3,
    pumpBeforeTest: pumpNTimes(5, const Duration(milliseconds: 100)),
    goldenTests: () => [
      GoldenTest(
        description: 'circular',
        child: goldenBox(
          width: 64,
          height: 64,
          child: ImpaktfullUiLoadingIndicator(theme: circularTheme),
        ),
      ),
      GoldenTest(
        description: 'circular with color',
        child: goldenBox(
          width: 64,
          height: 64,
          child: ImpaktfullUiLoadingIndicator(
            theme: circularTheme,
            color: Colors.red,
          ),
        ),
      ),
      GoldenTest(
        description: 'circular with a thick stroke',
        child: goldenBox(
          width: 64,
          height: 64,
          child: ImpaktfullUiLoadingIndicator(
            theme: ImpaktfullUiLoadingIndicatorTheme(
              assets: circularTheme.assets,
              colors: circularTheme.colors,
              dimens: const ImpaktfullUiLoadingIndicatorDimensTheme(
                strokeWidth: 8,
              ),
            ),
          ),
        ),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_loading_indicator_lottie',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'default (lottie of the theme)',
        child: frozen(
          goldenBox(
            width: 64,
            height: 64,
            child: const ImpaktfullUiLoadingIndicator(),
          ),
        ),
      ),
      GoldenTest(
        description: 'lottie with color',
        child: frozen(
          goldenBox(
            width: 64,
            height: 64,
            child: const ImpaktfullUiLoadingIndicator(color: Colors.red),
          ),
        ),
      ),
    ],
  );
}
