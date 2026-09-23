import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
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

  /// Set from the theme in `didChangeDependencies`, before it is used.
  late Duration _cropDebounce;
  var _startedInitialCrop = false;

  // The theme is only available once the dependencies are there, so the first
  // crop starts here instead of in `initState`.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cropDebounce =
        ImpaktfullUiImageCropTheme.of(context).durations.cropDebounce;
    if (_startedInitialCrop) return;
    _startedInitialCrop = true;
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
          FileSizeCalculationUtil.calculateFileSize(_imageBytes!.length,
              context: context),
          style: ImpaktfullUiTheme.of(context).textStyles.onCanvas.text.small,
        ),
      ],
    );
  }

  void _debouncedCrop() {
    setState(() => _imageBytes = null);
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_cropDebounce, _crop);
  }

  Future<void> _crop() async {
    _image ??= await cropper.downloadImage(
      widget.imageUrl,
    );
    if (!mounted) return;
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
