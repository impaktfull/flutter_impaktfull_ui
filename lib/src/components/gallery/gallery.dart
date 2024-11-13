import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/gallery/gallery_style.dart';
import 'package:impaktfull_ui_2/src/components/gallery/model/gallery_item.dart';
import 'package:impaktfull_ui_2/src/components/gallery/widget/gallery_full_screen.dart';
import 'package:impaktfull_ui_2/src/components/gallery/widget/gallery_hero_item.dart';
import 'package:impaktfull_ui_2/src/components/grid_view/grid_view.dart';
import 'package:impaktfull_ui_2/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'gallery_style.dart';
export 'model/gallery_item.dart';
export 'widget/gallery_full_screen.dart';
export 'widget/gallery_hero_item.dart';

part 'gallery.describe.dart';

class ImpaktfullUiGallery extends StatelessWidget with ComponentDescriptorMixin {
  final List<ImpaktfullUiGalleryItem> items;
  final BorderRadiusGeometry? itemBorderRadius;
  final int Function(BuildContext, ImpaktfullUiGridViewConfig)? crossAxisCount;
  final double Function(BuildContext, ImpaktfullUiGridViewConfig)? itemAspectRatio;
  final double spacing;
  final ImpaktfullUiGalleryTheme? theme;

  const ImpaktfullUiGallery({
    required this.items,
    this.itemBorderRadius,
    this.itemAspectRatio,
    this.crossAxisCount,
    this.spacing = 16,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiGalleryTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiGridView.builder(
        items: items,
        spacing: spacing,
        padding: const EdgeInsets.all(16),
        noDataLabel: 'No Gallery Items',
        itemBuilder: (context, item, index) => ImpaktfullUiTouchFeedback(
          borderRadius: itemBorderRadius ?? componentTheme.dimens.itemBorderRadius,
          onTap: () => ImpaktfullUiGalleryFullScreen.show(
            context: context,
            componentTheme: componentTheme,
            items: items,
            initialItem: item,
          ),
          child: ImpaktfullUiGalleryHeroItem(
            item: item,
          ),
        ),
        itemAspectRatio: itemAspectRatio,
        crossAxisCount: crossAxisCount ?? (context, config) => config.maxWidth ~/ 250,
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
