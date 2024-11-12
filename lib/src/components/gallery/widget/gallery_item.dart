import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/gallery/gallery.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiGalleryItemWidget extends StatefulWidget {
  final ImpaktfullUiGalleryItem item;
  final ImpaktfullUiGalleryTheme theme;
  const ImpaktfullUiGalleryItemWidget({
    required this.item,
    required this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiGalleryItemWidget> createState() =>
      _ImpaktfullUiGalleryItemWidgetState();
}

class _ImpaktfullUiGalleryItemWidgetState
    extends State<ImpaktfullUiGalleryItemWidget> {
  late TransformationController _transformationController;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => InteractiveViewer(
        transformationController: _transformationController,
        minScale: 1.0,
        maxScale: 4.0,
        child: Center(
          child: Hero(
            tag: widget.item.heroTag,
            child: widget.item.child,
          ),
        ),
      ),
    );
  }
}
