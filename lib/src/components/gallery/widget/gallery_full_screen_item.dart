import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/gallery/gallery.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiGalleryFullScreenItemWidget extends StatefulWidget {
  final ImpaktfullUiGalleryItem item;
  final double maxScale;
  final ImpaktfullUiGalleryTheme theme;

  const ImpaktfullUiGalleryFullScreenItemWidget({
    required this.item,
    required this.theme,
    this.maxScale = 4.0,
    super.key,
  });

  @override
  State<ImpaktfullUiGalleryFullScreenItemWidget> createState() => _ImpaktfullUiGalleryFullScreenItemWidgetState();
}

class _ImpaktfullUiGalleryFullScreenItemWidgetState extends State<ImpaktfullUiGalleryFullScreenItemWidget>
    with SingleTickerProviderStateMixin {
  late TransformationController _transformationController;
  late AnimationController _animationController;
  late Animation<Matrix4> _animation;
  TapDownDetails? _doubleTapDetails;
  final _interactiveViewerKey = GlobalKey();
  final _imageKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _transformationController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  void _handleDoubleTap() {
    Matrix4 endMatrix;
    if (_transformationController.value != Matrix4.identity()) {
      endMatrix = Matrix4.identity();
    } else {
      final renderBox = _interactiveViewerKey.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.globalToLocal(_doubleTapDetails!.globalPosition);
      endMatrix = Matrix4.identity()
        ..translate(-position.dx * 2, -position.dy * 2)
        ..scale(min(3.0, widget.maxScale));
    }

    _animation = Matrix4Tween(
      begin: _transformationController.value,
      end: endMatrix,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward(from: 0);
    _animation.addListener(() {
      _transformationController.value = _animation.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => InteractiveViewer(
        key: _interactiveViewerKey,
        transformationController: _transformationController,
        minScale: 1.0,
        maxScale: widget.maxScale,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Colors.transparent,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(64),
                child: GestureDetector(
                  onDoubleTapDown: _handleDoubleTapDown,
                  onDoubleTap: _handleDoubleTap,
                  child: ImpaktfullUiGalleryHeroItem(
                    key: _imageKey,
                    item: widget.item,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
