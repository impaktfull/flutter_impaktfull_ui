import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/gallery/gallery.localizations.dart';
import 'package:impaktfull_ui/src/components/gallery/gallery_style.dart';
import 'package:impaktfull_ui/src/components/gallery/model/gallery_item.dart';
import 'package:impaktfull_ui/src/components/gallery/widget/gallery_full_screen.dart';
import 'package:impaktfull_ui/src/components/gallery/widget/gallery_hero_item.dart';
import 'package:impaktfull_ui/src/components/grid_view/grid_view.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'gallery.localizations.dart';
export 'gallery_style.dart';
export 'model/gallery_item.dart';
export 'widget/gallery_full_screen.dart';
export 'widget/gallery_hero_item.dart';

class ImpaktfullUiGallery extends StatelessWidget {
  final List<ImpaktfullUiGalleryItem> items;
  final BorderRadiusGeometry? itemBorderRadius;
  final int Function(BuildContext, ImpaktfullUiGridViewConfig)? crossAxisCount;
  final double Function(BuildContext, ImpaktfullUiGridViewConfig)?
      itemAspectRatio;
  final double spacing;
  final BoxFit? itemFit;
  final String noDataLabel;
  final ImpaktfullUiGalleryTheme? theme;

  /// The texts of the gallery. Defaults to the localizations of the app.
  final ImpaktfullUiGalleryLocalizations? localizations;

  const ImpaktfullUiGallery({
    required this.items,
    required this.noDataLabel,
    this.itemBorderRadius,
    this.itemAspectRatio,
    this.crossAxisCount,
    this.spacing = 16,
    this.itemFit,
    this.theme,
    this.localizations,
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
        padding: componentTheme.dimens.padding,
        placeholderData: ImpaktfullUiGridViewPlaceholderData(
          title: noDataLabel,
        ),
        itemBuilder: (context, item, index) {
          final borderRadius =
              itemBorderRadius ?? componentTheme.dimens.itemBorderRadius;
          return ImpaktfullUiTouchFeedback(
            borderRadius: borderRadius,
            onTap: () => ImpaktfullUiGalleryFullScreen.show(
              context: context,
              componentTheme: componentTheme,
              items: items,
              initialItem: item,
              localizations: localizations,
            ),
            // The touch feedback does not clip its child: clip the image.
            child: ClipRRect(
              borderRadius: borderRadius,
              child: ImpaktfullUiGalleryHeroItem(
                item: item,
                fit: itemFit,
              ),
            ),
          );
        },
        itemAspectRatio: itemAspectRatio,
        crossAxisCount:
            crossAxisCount ?? (context, config) => config.maxWidth ~/ 250,
      ),
    );
  }
}
