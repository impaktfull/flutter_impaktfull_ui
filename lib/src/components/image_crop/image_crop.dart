import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui/src/components/image_crop/controller/image_crop_controller.dart';
import 'package:impaktfull_ui/src/components/image_crop/image_crop_preview.dart';
import 'package:impaktfull_ui/src/components/image_crop/image_crop_style.dart';
import 'package:impaktfull_ui/src/components/image_crop/model/crop_info.dart';
import 'package:impaktfull_ui/src/components/image_crop/overlay/image_crop_overlay.dart';
import 'package:impaktfull_ui/src/components/image_crop/overlay/image_crop_square_overlay.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

export 'image_crop_style.dart';

part 'image_crop.describe.dart';

class ImpaktfullUiImageCrop extends StatefulWidget
    with ComponentDescriptorMixin {
  final ImpaktfullUiImageCropController? controller;
  final String? imageUrl;
  final double size;
  final Color backgroundColor;
  final ImpaktfullUiImageCropOverlay cropOverlay;
  final bool showPreview = false;
  final ImpaktfullUiImageCropTheme? theme;

  const ImpaktfullUiImageCrop({
    required this.size,
    this.controller,
    this.imageUrl,
    this.backgroundColor = const Color(0x00000000),
    this.cropOverlay = const ImpaktfullUiImageCropSquareOverlay(),
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

  double _baseScaleFactor = 1.0;

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
      scale: 1,
      position: Offset.zero,
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
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
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
                                asset: ImpaktfullUiAsset.icon(
                                    PhosphorIcons.arrowClockwise()),
                                color: componentTheme.colors.deleteIcon,
                                backgroundColor:
                                    Colors.black.withOpacityPercentage(0.33),
                              ),
                              ImpaktfullUiIconButton(
                                onTap: _onResetAllTapped,
                                asset: componentTheme.assets.delete,
                                color: componentTheme.colors.deleteIcon,
                                backgroundColor:
                                    Colors.black.withOpacityPercentage(0.33),
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
                            onScaleStart: _onScaleStart,
                            onScaleUpdate: _onScaleUpdate,
                            child: Material(
                              color: Colors.transparent,
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..setTranslationRaw(_cropInfo.position.dx,
                                      _cropInfo.position.dy, 0)
                                  ..scaleByDouble(_cropInfo.scale,
                                      _cropInfo.scale, _cropInfo.scale, 1),
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
                        Positioned.fill(
                          child: IgnorePointer(
                            child: CustomPaint(
                              painter: widget.cropOverlay
                                  .getCustomPainter(_cropInfo.cropRect),
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
                      onTap: _onZoomInTapped,
                      leadingAsset: ImpaktfullUiAsset.icon(
                          PhosphorIcons.magnifyingGlassPlus()),
                    ),
                    ImpaktfullUiButton(
                      type: ImpaktfullUiButtonType.secondaryGrey,
                      onTap: _onZoomOutTapped,
                      leadingAsset: ImpaktfullUiAsset.icon(
                          PhosphorIcons.magnifyingGlassMinus()),
                    ),
                    ImpaktfullUiButton(
                      type: ImpaktfullUiButtonType.secondaryGrey,
                      onAsyncTap: _onCropTapped,
                      leadingAsset:
                          ImpaktfullUiAsset.icon(PhosphorIcons.crop()),
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
      _baseScaleFactor = 1.0;
    });
  }

  void _onScaleStart(ScaleStartDetails details) {
    _baseScaleFactor = _cropInfo.scale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      final newScale = (_baseScaleFactor * details.scale).clamp(0.5, 3.0);
      _cropInfo = _cropInfo.copyWith(
        scale: newScale,
        position: _cropInfo.position + details.focalPointDelta,
      );
    });
  }

  void _onZoomInTapped() {
    setState(() {
      _cropInfo = _cropInfo.copyWith(
        scale: (_cropInfo.scale * 1.1).clamp(0.5, 3.0),
      );
    });
  }

  void _onZoomOutTapped() {
    setState(() {
      _cropInfo = _cropInfo.copyWith(
        scale: (_cropInfo.scale / 1.1).clamp(0.5, 3.0),
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
