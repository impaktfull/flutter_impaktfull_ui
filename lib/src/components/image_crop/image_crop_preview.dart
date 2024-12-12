import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/image_crop/cropper/image_crop_cropper.dart';
import 'package:impaktfull_ui/src/components/image_crop/model/crop_info.dart';
import 'package:impaktfull_ui/src/util/file_size/file_size_calculation_util.dart';

class ImageCropPreview extends StatefulWidget {
  final String imageUrl;
  final double size;
  final ImpaktfullUiImageCropInfo cropInfo;

  const ImageCropPreview({
    required this.imageUrl,
    required this.cropInfo,
    required this.size,
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
    // if (widget.cropInfo != oldWidget.cropInfo) {
    _debouncedCrop();
    // }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_imageBytes == null) {
      return SizedBox(
        height: widget.size,
        width: widget.size,
        child: const Center(
          child: ImpaktfullUiLoadingIndicator(),
        ),
      );
    }
    return ImpaktfullUiAutoLayout.vertical(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: widget.size,
          width: widget.size,
          color: Colors.grey,
          child: Image.memory(
            _imageBytes!,
          ),
        ),
        Text(
          FileSizeCalculationUtil.calculateFileSize(_imageBytes!.length),
          style: theme.textStyles.onCanvas.text.small,
        ),
      ],
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() => _imageBytes = bytes?.buffer.asUint8List());
    });
  }
}
