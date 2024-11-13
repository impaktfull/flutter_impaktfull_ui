import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/gallery/gallery.dart';

class ImpaktfullUiGalleryHeroItem extends StatelessWidget {
  final ImpaktfullUiGalleryItem item;

  const ImpaktfullUiGalleryHeroItem({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: item.heroTag,
      child: item.child,
    );
  }
}
