import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../util/golden_test_util.dart';
import '../../util/golden_test_variant.dart';

/// A few representative components rendered with the default dark theme, so a
/// change to the dark defaults of `ImpaktfullUiDefaultTheme.withMinimalChanges`
/// shows up as an image diff.
void main() {
  setUp(() => setupComponentTest());

  final theme = ImpaktfullUiTheme.getDefaultDark();

  GoldenTest darkCase(String description, Widget child) => GoldenTest(
        description: description,
        child: ImpaktfullUiContainer(
          color: theme.colors.canvas,
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_dark_theme',
    columns: 2,
    theme: theme,
    goldenTests: () => [
      darkCase(
        'buttons',
        ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            for (final type in [
              ImpaktfullUiButtonType.primary,
              ImpaktfullUiButtonType.secondary,
              ImpaktfullUiButtonType.destructivePrimary,
            ])
              ImpaktfullUiButton(type: type, title: 'Button', onTap: () {}),
          ],
        ),
      ),
      darkCase(
        'card',
        SizedBox(
          width: 220,
          child: ImpaktfullUiCard(
            child: ImpaktfullUiAutoLayout.vertical(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                Text('Title',
                    style: theme.textStyles.onCard.display.extraSmall),
                Text('Subtitle',
                    style: theme.textStyles.onCardTertiary.text.small),
              ],
            ),
          ),
        ),
      ),
      darkCase(
        'input field',
        SizedBox(
          width: 220,
          child: ImpaktfullUiInputField(
            label: 'Label',
            hint: 'Hint',
            value: 'Value',
            onChanged: (_) {},
          ),
        ),
      ),
      darkCase(
        'selection',
        ImpaktfullUiAutoLayout.horizontal(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            ImpaktfullUiCheckbox(value: true, onChanged: (_) {}),
            ImpaktfullUiSwitch(value: true, onChanged: (_) {}),
            ImpaktfullUiBadge(
              type: ImpaktfullUiBadgeType.primary,
              title: 'Badge',
            ),
          ],
        ),
      ),
    ],
  );
}
