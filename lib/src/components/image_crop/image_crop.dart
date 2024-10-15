import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/button/button.dart';
import 'package:impaktfull_ui_2/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/controller/image_crop_controller.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/image_crop_preview.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/image_crop_style.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/model/crop_info.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/overlay/image_crop_overlay.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/overlay/image_crop_square_overlay.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

export 'image_crop_style.dart';

part 'image_crop.describe.dart';

class ImpaktfullUiImageCrop extends StatefulWidget with ComponentDescriptorMixin {
  final ImpaktfullUiImageCropController? controller;
  final String? imageUrl;
  final double size;
  final Color backgroundColor;
  final ImpaktfullUiImageCropOverlay cropOverlay;
  final bool showPreview;
  final ImpaktfullUiImageCropTheme? theme;

  const ImpaktfullUiImageCrop({
    required this.size,
    this.controller,
    this.imageUrl,
    this.backgroundColor = const Color(0x00000000),
    this.cropOverlay = const ImpaktfullUiImageCropSquareOverlay(),
    this.showPreview = false,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiImageCrop> createState() => _ImpaktfullUiImageCropState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiImageCropState extends State<ImpaktfullUiImageCrop> {
  late ImpaktfullUiImageCropInfo _cropInfo;
  Uint8List? _croppedImageBytes;

  late final ImpaktfullUiImageCropController _controller;

  @override
  void initState() {
    super.initState();
    final padding = widget.size / 8;
    final cropSize = widget.size - padding * 2;
    _cropInfo = ImpaktfullUiImageCropInfo(
      cropRect: Rect.fromLTWH(
        padding,
        padding,
        cropSize,
        cropSize,
      ),
      width: widget.size,
      height: widget.size,
      rotation: 0,
      scale: 1,
      position: Offset.zero,
      isFlippedHorizontal: false,
      isFlippedVertical: false,
      backgroundColor: widget.backgroundColor,
    );
    _controller = widget.controller ?? ImpaktfullUiImageCropController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiImageCropTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        if (_croppedImageBytes != null) {
          return ImpaktfullUiAutoLayout.vertical(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              SizedBox(
                width: widget.size,
                height: widget.size,
                child: Container(
                  color: widget.backgroundColor,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.memory(
                        _croppedImageBytes!,
                      ),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ImpaktfullUiAutoLayout.horizontal(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 8,
                            children: [
                              ImpaktfullUiIconButton(
                                onTap: _onBackToEditingTapped,
                                asset: ImpaktfullUiAsset.icon(PhosphorIcons.arrowClockwise()),
                                color: componentTheme.colors.deleteIcon,
                                backgroundColor: Colors.black.withOpacity(0.33),
                              ),
                              ImpaktfullUiIconButton(
                                onTap: _onResetAllTapped,
                                asset: componentTheme.assets.delete,
                                color: componentTheme.colors.deleteIcon,
                                backgroundColor: Colors.black.withOpacity(0.33),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return ImpaktfullUiAutoLayout.horizontal(
          spacing: 8,
          children: [
            ImpaktfullUiAutoLayout.vertical(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                SizedBox(
                  width: widget.size,
                  height: widget.size,
                  child: ClipRect(
                    child: Stack(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      children: [
                        Positioned.fill(
                          child: GestureDetector(
                            onScaleUpdate: _onScaleUpdate,
                            child: Material(
                              color: Colors.transparent,
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..translate(_cropInfo.position.dx, _cropInfo.position.dy)
                                  ..scale(_cropInfo.scale)
                                  ..rotateZ(_cropInfo.rotation),
                                alignment: Alignment.center,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..scale(
                                      _cropInfo.isFlippedHorizontal ? -1.0 : 1.0,
                                      _cropInfo.isFlippedVertical ? -1.0 : 1.0,
                                    ),
                                  alignment: Alignment.center,
                                  child: Builder(builder: (context) {
                                    if (widget.imageUrl != null) {
                                      return Image.network(
                                        widget.imageUrl!,
                                      );
                                    }
                                    throw Exception('Image not found');
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: IgnorePointer(
                            child: CustomPaint(
                              painter: widget.cropOverlay.getCustomPainter(_cropInfo.cropRect),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ImpaktfullUiAutoLayout.horizontal(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    ImpaktfullUiButton(
                      type: ImpaktfullUiButtonType.secondaryGrey,
                      onTap: _onRotateTapped,
                      leadingAsset: ImpaktfullUiAsset.icon(PhosphorIcons.arrowClockwise()),
                    ),
                    ImpaktfullUiButton(
                      type: ImpaktfullUiButtonType.secondaryGrey,
                      onTap: _onFlipHorizontalTapped,
                      leadingAsset: ImpaktfullUiAsset.icon(PhosphorIcons.flipHorizontal()),
                    ),
                    ImpaktfullUiButton(
                      type: ImpaktfullUiButtonType.secondaryGrey,
                      onTap: _onFlipVerticalTapped,
                      leadingAsset: ImpaktfullUiAsset.icon(PhosphorIcons.flipVertical()),
                    ),
                    ImpaktfullUiButton(
                      type: ImpaktfullUiButtonType.secondaryGrey,
                      onAsyncTap: _onCropTapped,
                      leadingAsset: ImpaktfullUiAsset.icon(PhosphorIcons.crop()),
                    ),
                  ],
                ),
              ],
            ),
            if (widget.showPreview) ...[
              ImageCropPreview(
                size: widget.size,
                cropInfo: _cropInfo,
                imageUrl: widget.imageUrl!,
              ),
            ],
          ],
        );
      },
    );
  }

  void _onBackToEditingTapped() {
    setState(() => _croppedImageBytes = null);
  }

  void _onResetAllTapped() {
    setState(() {
      _croppedImageBytes = null;
      _cropInfo = _cropInfo.copyWith(
        scale: 1.0,
        rotation: 0,
        position: Offset.zero,
        isFlippedHorizontal: false,
        isFlippedVertical: false,
      );
    });
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _cropInfo = _cropInfo.copyWith(
        scale: (_cropInfo.scale * details.scale).clamp(0.5, 3.0),
        rotation: _cropInfo.rotation + details.rotation,
        position: _cropInfo.position + details.focalPointDelta,
      );
    });
  }

  void _onFlipHorizontalTapped() {
    setState(() {
      _cropInfo = _cropInfo.copyWith(
        isFlippedHorizontal: !_cropInfo.isFlippedHorizontal,
      );
    });
  }

  void _onFlipVerticalTapped() {
    setState(() {
      _cropInfo = _cropInfo.copyWith(
        isFlippedVertical: !_cropInfo.isFlippedVertical,
      );
    });
  }

  void _onRotateTapped() {
    setState(() {
      _cropInfo = _cropInfo.copyWith(
        rotation: _cropInfo.rotation + (pi / 2),
      );
    });
  }

  Future<void> _onCropTapped() async {
    final imageUrl = widget.imageUrl;
    if (imageUrl == null) return;
    final result = await _controller.cropUrl(
      cropInfo: _cropInfo,
      imageUrl: imageUrl,
    );
    final bytes = await result.toByteData(format: ui.ImageByteFormat.png);
    setState(() => _croppedImageBytes = bytes?.buffer.asUint8List());
  }
}
