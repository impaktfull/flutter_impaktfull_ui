import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  const content =
      SizedBox(width: 80, height: 40, child: Center(child: Text('child')));

  runComponentTest(
    fileName: 'impaktfull_ui_container',
    columns: 4,
    goldenTests: () => [
      layoutGoldenCase(
        'Color',
        ImpaktfullUiContainer(color: theme.colors.card, child: content),
      ),
      layoutGoldenCase(
        'Border radius',
        ImpaktfullUiContainer(
          color: theme.colors.card,
          borderRadius: BorderRadius.circular(12),
          child: content,
        ),
      ),
      layoutGoldenCase(
        'Uniform border',
        ImpaktfullUiContainer(
          color: theme.colors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.colors.accent, width: 2),
          child: content,
        ),
      ),
      layoutGoldenCase(
        'Non uniform border',
        ImpaktfullUiContainer(
          color: theme.colors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border(
            bottom: BorderSide(color: theme.colors.accent, width: 4),
            top: BorderSide(color: theme.colors.accent, width: 1),
          ),
          child: content,
        ),
      ),
      layoutGoldenCase(
        'Shadow',
        ImpaktfullUiContainer(
          color: theme.colors.card,
          borderRadius: BorderRadius.circular(12),
          margin: const EdgeInsets.all(8),
          shadow: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
          child: content,
        ),
      ),
      layoutGoldenCase(
        'Padding and margin',
        ImpaktfullUiContainer(
          color: theme.colors.card,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(12),
          child: content,
        ),
      ),
      layoutGoldenCase(
        'Width and height',
        ImpaktfullUiContainer(
          color: theme.colors.accent,
          width: 120,
          height: 60,
          child: content,
        ),
      ),
    ],
  );
}
