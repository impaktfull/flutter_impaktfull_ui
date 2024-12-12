import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/styles_library/config/styles_library_item.dart';
import 'package:impaktfull_ui_example/src/styles_library/items/colors/widget/color_style_card.dart';

class ColorsStyleItem extends StylesLibraryItem {
  const ColorsStyleItem();

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
          label: 'primary',
        ),
        ColorStyleCard(
          color: theme.colors.accent,
          label: 'accent',
        ),
        ColorStyleCard(
          color: theme.colors.secondary,
          label: 'secondary',
        ),
        ColorStyleCard(
          color: theme.colors.tertiary,
          label: 'tertiary',
        ),
        ColorStyleCard(
          color: theme.colors.canvas,
          label: 'canvas',
        ),
        ColorStyleCard(
          color: theme.colors.card,
          label: 'card',
        ),
        ColorStyleCard(
          color: theme.colors.card2,
          label: 'card2',
        ),
        ColorStyleCard(
          color: theme.colors.border,
          label: 'border',
        ),
        ColorStyleCard(
          color: theme.colors.shadow,
          label: 'shadow',
        ),
        ColorStyleCard(
          color: theme.colors.text,
          label: 'text',
        ),
        ColorStyleCard(
          color: theme.colors.textOnPrimary,
          label: 'textOnPrimary',
        ),
        ColorStyleCard(
          color: theme.colors.textOnAccent,
          label: 'textOnAccent',
        ),
        ColorStyleCard(
          color: theme.colors.textOnSecondary,
          label: 'textOnSecondary',
        ),
        ColorStyleCard(
          color: theme.colors.textOnDestructive,
          label: 'textOnDestructive',
        ),
        ColorStyleCard(
          color: theme.colors.warning,
          label: 'warning',
        ),
        ColorStyleCard(
          color: theme.colors.error,
          label: 'error',
        ),
        ColorStyleCard(
          color: theme.colors.info,
          label: 'info',
        ),
        ColorStyleCard(
          color: theme.colors.success,
          label: 'success',
        ),
        ColorStyleCard(
          color: theme.colors.destructive,
          label: 'destructive',
        ),
      ],
    );
  }
}
