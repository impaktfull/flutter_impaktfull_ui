import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/gallery/gallery.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiGalleryFullScreenItemWidget extends StatefulWidget {
  final ImpaktfullUiGalleryItem item;
  final ImpaktfullUiGalleryTheme theme;
  const ImpaktfullUiGalleryFullScreenItemWidget({
    required this.item,
    required this.theme,
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
      final position = _doubleTapDetails!.localPosition;
      endMatrix = Matrix4.identity()
        ..translate(-position.dx * 2, -position.dy * 2)
        ..scale(3.0);
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
      builder: (context, componentTheme) => GestureDetector(
        onDoubleTapDown: _handleDoubleTapDown,
        onDoubleTap: _handleDoubleTap,
        child: InteractiveViewer(
          transformationController: _transformationController,
          minScale: 1.0,
          maxScale: 4.0,
          child: Center(
            child: ImpaktfullUiGalleryHeroItem(
              item: widget.item,
            ),
          ),
        ),
      ),
    );
  }
}
