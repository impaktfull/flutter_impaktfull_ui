import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  const content = Text('Card content');

  runComponentTest(
    fileName: 'impaktfull_ui_card',
    columns: 3,
    goldenTests: () => [
      layoutGoldenCase(
        'Default',
        const ImpaktfullUiCard(child: content),
        width: 200,
      ),
      layoutGoldenCase(
        'Error',
        const ImpaktfullUiCard(error: true, child: content),
        width: 200,
      ),
      layoutGoldenCase(
        'With onTap',
        ImpaktfullUiCard(onTap: () {}, child: content),
        width: 200,
      ),
      layoutGoldenCase(
        'Custom padding and radius',
        ImpaktfullUiCard(
          padding: const EdgeInsets.all(32),
          borderRadius: BorderRadius.circular(24),
          child: content,
        ),
        width: 200,
      ),
      layoutGoldenCase(
        'Size and alignment',
        const ImpaktfullUiCard(
          width: 200,
          height: 100,
          alignment: Alignment.bottomRight,
          child: content,
        ),
      ),
      layoutGoldenCase(
        'No shadow',
        const ImpaktfullUiCard(shadow: [], child: content),
        width: 200,
      ),
    ],
  );
}
