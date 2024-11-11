import 'package:flutter/widgets.dart';

class ImpaktfullUiGalleryItem {
  final String? title;
  final String? description;
  final String? id;
  final Widget? _child;
  final String? imageUrl;
  final BoxFit? imageFit;

  String get heroTag {
    if (id != null) return id!;
    return '';
  }

  Widget get child {
    if (imageUrl == null) return _child!;
    return Image.network(
      imageUrl!,
      fit: imageFit,
    );
  }

  const ImpaktfullUiGalleryItem({
    this.id,
    this.title,
    this.description,
    required Widget child,
  })  : _child = null,
        imageUrl = null,
        imageFit = null;

  const ImpaktfullUiGalleryItem.image({
    this.id,
    this.title,
    this.description,
    required this.imageUrl,
    this.imageFit = BoxFit.contain,
  }) : _child = null;
}
