import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/image/x_file_image.dart';
import 'package:impaktfull_ui/src/util/io_file/io_file.dart';

class ImpaktfullUiGalleryItem {
  final String? title;
  final String? description;
  final String? id;
  final Widget? _child;
  final String? imageUrl;

  /// The encoded image (e.g. PNG or JPEG), see [ImpaktfullUiGalleryItem.bytes].
  final Uint8List? bytes;

  /// The image file, see [ImpaktfullUiGalleryItem.xFile].
  final XFile? xFile;

  @Deprecated(
      'Use xFile or bytes instead, they work on every platform including the web. Will be removed in 1.0.0.')
  final File? file;
  final BoxFit? imageFit;

  String get heroTag {
    if (id != null) return id!;
    if (imageUrl != null) return imageUrl!;
    // On the web the path of an XFile is a blob url, or empty for XFile.fromData
    final xFilePath = xFile?.path;
    if (xFilePath != null && xFilePath.isNotEmpty) return xFilePath;
    // ignore: deprecated_member_use_from_same_package
    final ioFile = file;
    if (ioFile != null) {
      final path = ioFilePath(ioFile);
      if (path != null) return path;
    }
    // Every item needs its own tag: multiple heroes with the same tag throw.
    return 'impaktfull_ui_gallery_item_$hashCode';
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
    if (bytes != null) {
      return Image.memory(
        bytes!,
        fit: imageFit ?? fit,
      );
    }
    if (xFile != null) {
      return Image(
        image: ImpaktfullUiXFileImage(xFile!),
        fit: imageFit ?? fit,
      );
    }
    // ignore: deprecated_member_use_from_same_package
    final ioFile = file;
    if (ioFile != null) {
      return ioFileImage(
        ioFile,
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
  })  : _child = child,
        imageUrl = null,
        imageFit = null,
        bytes = null,
        xFile = null,
        file = null;

  const ImpaktfullUiGalleryItem.image({
    this.id,
    this.title,
    this.description,
    required String this.imageUrl,
    this.imageFit,
  })  : _child = null,
        bytes = null,
        xFile = null,
        file = null;

  /// An image from its encoded [bytes] (e.g. PNG or JPEG). Works on every
  /// platform.
  const ImpaktfullUiGalleryItem.bytes({
    this.id,
    this.title,
    this.description,
    required Uint8List this.bytes,
    this.imageFit,
  })  : _child = null,
        imageUrl = null,
        xFile = null,
        file = null;

  /// An image from an [XFile] (e.g. from image_picker or file_selector). Works
  /// on every platform.
  const ImpaktfullUiGalleryItem.xFile({
    this.id,
    this.title,
    this.description,
    required XFile this.xFile,
    this.imageFit,
  })  : _child = null,
        imageUrl = null,
        bytes = null,
        file = null;

  /// A `File` of `dart:io`. It can not be shown on the web.
  @Deprecated(
      'Use ImpaktfullUiGalleryItem.xFile or ImpaktfullUiGalleryItem.bytes instead, they work on every platform including the web. Will be removed in 1.0.0.')
  const ImpaktfullUiGalleryItem.file({
    this.id,
    this.title,
    this.description,
    required File this.file,
    this.imageFit,
  })  : _child = null,
        imageUrl = null,
        bytes = null,
        xFile = null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ImpaktfullUiGalleryItem &&
        other.title == title &&
        other.description == description &&
        other.id == id &&
        other._child == _child &&
        other.imageUrl == imageUrl &&
        other.bytes == bytes &&
        other.xFile == xFile &&
        other.imageFit == imageFit;
  }

  @override
  int get hashCode => Object.hash(
        title,
        description,
        id,
        _child,
        imageUrl,
        bytes,
        xFile,
        imageFit,
      );
}
