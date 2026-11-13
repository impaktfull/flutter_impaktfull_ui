import 'package:material_ui/material_ui.dart';
import 'package:impaktfull_ui/src/components/gallery/gallery.dart';

class ImpaktfullUiGalleryHeroItem extends StatelessWidget {
  final ImpaktfullUiGalleryItem item;
  final BoxFit? fit;

  const ImpaktfullUiGalleryHeroItem({
    required this.item,
    this.fit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: item.heroTag,
      child: item.child(
        fit: fit,
      ),
    );
  }
}
