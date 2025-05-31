import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/gallery/gallery_style.dart';
import 'package:impaktfull_ui/src/components/gallery/model/gallery_item.dart';
import 'package:impaktfull_ui/src/components/gallery/widget/gallery_full_screen.dart';
import 'package:impaktfull_ui/src/components/gallery/widget/gallery_hero_item.dart';
import 'package:impaktfull_ui/src/components/grid_view/grid_view.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component.dart';

export 'gallery_style.dart';
export 'model/gallery_item.dart';
export 'widget/gallery_full_screen.dart';
export 'widget/gallery_hero_item.dart';

part 'gallery.describe.dart';

class ImpaktfullUiGallery extends StatelessWidget
    with ComponentDescriptorMixin {
  final List<ImpaktfullUiGalleryItem> items;
  final BorderRadiusGeometry? itemBorderRadius;
  final int Function(BuildContext, ImpaktfullUiGridViewConfig)? crossAxisCount;
  final double Function(BuildContext, ImpaktfullUiGridViewConfig)?
      itemAspectRatio;
  final double spacing;
  final BoxFit? itemFit;
  final String noDataLabel;
  final ImpaktfullUiGalleryTheme? theme;

  const ImpaktfullUiGallery({
    required this.items,
    required this.noDataLabel,
    this.itemBorderRadius,
    this.itemAspectRatio,
    this.crossAxisCount,
    this.spacing = 16,
    this.itemFit,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiGridView.builder(
        items: items,
        spacing: spacing,
        padding: const EdgeInsets.all(16),
        noDataLabel: noDataLabel,
        itemBuilder: (context, item, index) => ImpaktfullUiTouchFeedback(
          borderRadius:
              itemBorderRadius ?? componentTheme.dimens.itemBorderRadius,
          onTap: () => ImpaktfullUiGalleryFullScreen.show(
            context: context,
            componentTheme: componentTheme,
            items: items,
            initialItem: item,
          ),
          child: ImpaktfullUiGalleryHeroItem(
            item: item,
            fit: itemFit,
          ),
        ),
        itemAspectRatio: itemAspectRatio,
        crossAxisCount:
            crossAxisCount ?? (context, config) => config.maxWidth ~/ 250,
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
