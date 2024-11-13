import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/styles_library/config/styles_library_item.dart';
import 'package:impaktfull_ui_example/src/styles_library/items/shadows/widget/shadows_style_card.dart';

class ShadowStyleItem extends StylesLibraryItem {
  const ShadowStyleItem();

  @override
  String get title => 'ImpaktfullUiStyleShadows';

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiGridView(
      padding: const EdgeInsets.all(16),
      spacing: 8,
      crossAxisCount: (context, config) => config.maxWidth ~/ 350,
      noDataLabel: 'No colors',
      children: [
        ShadowsStyleCard(
          shadow: theme.shadows.extraSmall,
          label: 'extraSmall',
        ),
        ShadowsStyleCard(
          shadow: theme.shadows.small,
          label: 'small',
        ),
        ShadowsStyleCard(
          shadow: theme.shadows.medium,
          label: 'medium',
        ),
        ShadowsStyleCard(
          shadow: theme.shadows.large,
          label: 'large',
        ),
        ShadowsStyleCard(
          shadow: theme.shadows.extraLarge,
          label: 'extraLarge',
        ),
      ],
    );
  }
}
