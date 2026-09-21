import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  Widget legend(BuildContext context, double value) => Center(
        child: Text(
          value.toStringAsFixed(0),
          style: ImpaktfullUiTheme.of(context).textStyles.onCanvas.text.small,
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_slider',
    columns: 2,
    goldenTests: () => [
      for (final value in [0.0, 25.0, 100.0]) ...[
        GoldenTest(
          child: goldenSized(ImpaktfullUiSlider(
            value: value,
            min: 0,
            max: 100,
            onChanged: (_) {},
          )),
        ),
      ],
      GoldenTest(
        child: goldenSized(const ImpaktfullUiSlider(
          value: 50,
          min: 0,
          max: 100,
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiSlider(
          value: 150,
          min: 0,
          max: 100,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiSlider(
          value: 5,
          min: 5,
          max: 5,
          onChanged: (_) {},
        )),
      ),
      for (final alignment in ImpaktfullUiSliderLegendAlignment.values) ...[
        GoldenTest(
          child: goldenSized(
            SizedBox(
              height: 72,
              child: ImpaktfullUiSlider(
                value: 60,
                min: 0,
                max: 100,
                legendAlignment: alignment,
                legendBuilder: legend,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      ],
    ],
  );
}
