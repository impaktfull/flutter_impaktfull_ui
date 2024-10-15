import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/cropper/image_crop_cropper.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/model/crop_info.dart';
import 'package:impaktfull_ui_2/src/components/loading_indicator/loading_indicator.dart';

class ImageCropPreview extends StatefulWidget {
  final String imageUrl;
  final ImpaktfullUiImageCropInfo cropInfo;

  const ImageCropPreview({
    required this.imageUrl,
    required this.cropInfo,
    super.key,
  });

  @override
  State<ImageCropPreview> createState() => _ImageCropPreviewState();
}

class _ImageCropPreviewState extends State<ImageCropPreview> {
  final cropper = ImpaktfullUiImageCropCropper();
  ui.Image? _image;
  Uint8List? _imageBytes;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _debouncedCrop();
  }

  @override
  void didUpdateWidget(covariant ImageCropPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.cropInfo != oldWidget.cropInfo) {
      _debouncedCrop();
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_imageBytes == null) {
      return const Center(
        child: ImpaktfullUiLoadingIndicator(),
      );
    }
    return Container(
      color: Colors.grey,
      child: Image.memory(
        _imageBytes!,
      ),
    );
  }

  void _debouncedCrop() {
    setState(() => _imageBytes = null);
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), _crop);
  }

  Future<void> _crop() async {
    _image ??= await cropper.downloadImage(
      widget.imageUrl,
    );
    setState(() {
      _imageBytes = null;
    });
    final image = await cropper.cropImage(
      cropInfo: widget.cropInfo,
      image: _image,
    );

    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    setState(() => _imageBytes = bytes?.buffer.asUint8List());
  }
}
