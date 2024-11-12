import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/styles_library/config/styles_library_item.dart';
import 'package:impaktfull_ui_example/src/styles_library/items/colors/widget/color_style_card.dart';

class ColorsStyle extends StylesLibraryItem {
  const ColorsStyle();

  @override
  String get title => 'ImpaktfullUiStyleColors';

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiGridView(
      padding: const EdgeInsets.all(16),
      spacing: 8,
      crossAxisCount: (context, config) => config.maxWidth ~/ 250,
      noDataLabel: 'No colors',
      children: [
        ColorStyleCard(
          color: theme.colors.primary,
          label: 'Primary',
        ),
        ColorStyleCard(
          color: theme.colors.accent,
          label: 'Accent',
        ),
        ColorStyleCard(
          color: theme.colors.secondary,
          label: 'Secondary',
        ),
        ColorStyleCard(
          color: theme.colors.tertiary,
          label: 'Tertiary',
        ),
        ColorStyleCard(
          color: theme.colors.canvas,
          label: 'Canvas',
        ),
        ColorStyleCard(
          color: theme.colors.card,
          label: 'Card',
        ),
        ColorStyleCard(
          color: theme.colors.card2,
          label: 'Card2',
        ),
        ColorStyleCard(
          color: theme.colors.border,
          label: 'Border',
        ),
        ColorStyleCard(
          color: theme.colors.shadow,
          label: 'Shadow',
        ),
        ColorStyleCard(
          color: theme.colors.text,
          label: 'Text',
        ),
        ColorStyleCard(
          color: theme.colors.textOnPrimary,
          label: 'TextOnPrimary',
        ),
        ColorStyleCard(
          color: theme.colors.textOnAccent,
          label: 'TextOnAccent',
        ),
        ColorStyleCard(
          color: theme.colors.textOnSecondary,
          label: 'TextOnSecondary',
        ),
        ColorStyleCard(
          color: theme.colors.textOnDestructive,
          label: 'TextOnDestructive',
        ),
        ColorStyleCard(
          color: theme.colors.warning,
          label: 'Warning',
        ),
        ColorStyleCard(
          color: theme.colors.error,
          label: 'Error',
        ),
        ColorStyleCard(
          color: theme.colors.info,
          label: 'Info',
        ),
        ColorStyleCard(
          color: theme.colors.success,
          label: 'Success',
        ),
        ColorStyleCard(
          color: theme.colors.destructive,
          label: 'Destructive',
        ),
      ],
    );
  }
}
