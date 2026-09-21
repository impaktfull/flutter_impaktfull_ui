import 'dart:ui' as ui;

import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

/// Decodes the image of an [XFile].
///
/// Reads the bytes with [XFile.readAsBytes], so it works on every platform,
/// including the web (where an [XFile] is backed by a blob or by bytes).
@immutable
class ImpaktfullUiXFileImage extends ImageProvider<ImpaktfullUiXFileImage> {
  final XFile file;
  final double scale;

  const ImpaktfullUiXFileImage(
    this.file, {
    this.scale = 1.0,
  });

  @override
  Future<ImpaktfullUiXFileImage> obtainKey(ImageConfiguration configuration) =>
      SynchronousFuture<ImpaktfullUiXFileImage>(this);

  @override
  ImageStreamCompleter loadImage(
    ImpaktfullUiXFileImage key,
    ImageDecoderCallback decode,
  ) =>
      MultiFrameImageStreamCompleter(
        codec: _loadAsync(key, decode),
        scale: key.scale,
        debugLabel: key.file.name,
        informationCollector: () => [
          ErrorDescription('XFile: ${key.file.name} (${key.file.path})'),
        ],
      );

  Future<ui.Codec> _loadAsync(
    ImpaktfullUiXFileImage key,
    ImageDecoderCallback decode,
  ) async {
    final bytes = await key.file.readAsBytes();
    if (bytes.isEmpty) {
      // Do not cache the failure, the file can be filled later.
      PaintingBinding.instance.imageCache.evict(key);
      throw StateError('${key.file.name} is empty and can not be decoded.');
    }
    return decode(await ui.ImmutableBuffer.fromUint8List(bytes));
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is ImpaktfullUiXFileImage &&
        identical(other.file, file) &&
        other.scale == scale;
  }

  @override
  int get hashCode => Object.hash(identityHashCode(file), scale);

  @override
  String toString() =>
      '${objectRuntimeType(this, 'ImpaktfullUiXFileImage')}("${file.name}", scale: ${scale.toStringAsFixed(1)})';
}
