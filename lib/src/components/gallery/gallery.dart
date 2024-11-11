import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/gallery/gallery_style.dart';
import 'package:impaktfull_ui_2/src/components/gallery/model/gallery_item.dart';
import 'package:impaktfull_ui_2/src/components/grid_view/grid_view.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'gallery_style.dart';
export 'model/gallery_item.dart';

part 'gallery.describe.dart';

class ImpaktfullUiGallery extends StatelessWidget with ComponentDescriptorMixin {
  final List<ImpaktfullUiGalleryItem> items;
  final int Function(BuildContext, ImpaktfullUiGridViewConfig)? crossAxisCount;
  final double Function(BuildContext, ImpaktfullUiGridViewConfig)? itemAspectRatio;
  final ImpaktfullUiGalleryTheme? theme;

  const ImpaktfullUiGallery({
    required this.items,
    this.itemAspectRatio,
    this.crossAxisCount,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiGalleryTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiGridView.builder(
        items: items,
        spacing: 16,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, item, index) => item.child,
        childAspectRatio: itemAspectRatio,
        crossAxisCount: crossAxisCount ?? (context, config) => config.maxWidth ~/ 250,
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
