import 'dart:io';

import 'package:flutter/widgets.dart';

class ImpaktfullUiGalleryItem {
  final String? title;
  final String? description;
  final String? id;
  final Widget? _child;
  final String? imageUrl;
  final File? file;
  final BoxFit? imageFit;

  String get heroTag {
    if (id != null) return id!;
    if (imageUrl != null) return imageUrl!;
    return '';
  }

  Widget child({
    BoxFit? fit,
  }) {
    if (_child != null) return _child;
    if (imageUrl != null) {
      return Image.network(
        imageUrl!,
        fit: imageFit ?? fit,
      );
    }
    if (file != null) {
      return Image.file(
        file!,
        fit: imageFit ?? fit,
      );
    }
    throw Exception('No image or file provided');
  }

  bool get hasInfo => title != null || description != null;

  const ImpaktfullUiGalleryItem({
    this.id,
    this.title,
    this.description,
    required Widget child,
  })  : _child = null,
        imageUrl = null,
        imageFit = null,
        file = null;

  const ImpaktfullUiGalleryItem.image({
    this.id,
    this.title,
    this.description,
    required String this.imageUrl,
    this.imageFit,
  })  : _child = null,
        file = null;

  const ImpaktfullUiGalleryItem.file({
    this.id,
    this.title,
    this.description,
    required File this.file,
    this.imageFit,
  })  : _child = null,
        imageUrl = null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ImpaktfullUiGalleryItem &&
        other.title == title &&
        other.description == description &&
        other.id == id &&
        other._child == _child &&
        other.imageUrl == imageUrl &&
        other.imageFit == imageFit;
  }

  @override
  int get hashCode => Object.hash(
        title,
        description,
        id,
        _child,
        imageUrl,
        imageFit,
      );
}
