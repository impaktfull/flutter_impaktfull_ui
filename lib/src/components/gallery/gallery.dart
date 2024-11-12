import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/gallery/gallery_style.dart';
import 'package:impaktfull_ui_2/src/components/gallery/model/gallery_item.dart';
import 'package:impaktfull_ui_2/src/components/gallery/widget/gallery_item.dart';
import 'package:impaktfull_ui_2/src/components/grid_view/grid_view.dart';
import 'package:impaktfull_ui_2/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'gallery_style.dart';
export 'model/gallery_item.dart';

part 'gallery.describe.dart';

class ImpaktfullUiGallery extends StatelessWidget
    with ComponentDescriptorMixin {
  final List<ImpaktfullUiGalleryItem> items;
  final int Function(BuildContext, ImpaktfullUiGridViewConfig)? crossAxisCount;
  final double Function(BuildContext, ImpaktfullUiGridViewConfig)?
      itemAspectRatio;
  final ImpaktfullUiGalleryTheme? theme;

  const ImpaktfullUiGallery({
    required this.items,
    this.itemAspectRatio,
    this.crossAxisCount,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiGalleryTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiGridView.builder(
        items: items,
        spacing: 16,
        padding: const EdgeInsets.all(16),
        noDataLabel: 'No Gallery Items',
        itemBuilder: (context, item, index) => GestureDetector(
          onTap: () => _showGalleryOverlay(
            context,
            componentTheme,
            index,
          ),
          child: Hero(
            tag: item.heroTag,
            child: item.child,
          ),
        ),
        childAspectRatio: itemAspectRatio,
        crossAxisCount:
            crossAxisCount ?? (context, config) => config.maxWidth ~/ 250,
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  void _showGalleryOverlay(
    BuildContext context,
    ImpaktfullUiGalleryTheme componentTheme,
    int initialIndex,
  ) =>
      showDialog(
        context: context,
        useSafeArea: false,
        barrierDismissible: false,
        builder: (context) => _FullScreenGallery(
          items: items,
          initialIndex: initialIndex,
          theme: componentTheme,
        ),
      );
}

class _FullScreenGallery extends StatefulWidget {
  final List<ImpaktfullUiGalleryItem> items;
  final int initialIndex;
  final ImpaktfullUiGalleryTheme theme;

  const _FullScreenGallery({
    required this.items,
    required this.initialIndex,
    required this.theme,
  });

  @override
  State<_FullScreenGallery> createState() => _FullScreenGalleryState();
}

class _FullScreenGalleryState extends State<_FullScreenGallery> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void didUpdateWidget(covariant _FullScreenGallery oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialIndex != widget.initialIndex) {
      _pageController.jumpTo(widget.initialIndex.toDouble());
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              color: Colors.black87,
            ),
          ),
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              return ImpaktfullUiGalleryItemWidget(
                item: item,
                theme: componentTheme,
              );
            },
          ),
          Positioned(
            top: 16,
            right: 16,
            child: ImpaktfullUiIconButton(
              asset: componentTheme.assets.close,
              color: componentTheme.colors.close,
              onTap: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }

  void _onPageChanged(int value) {
    setState(() {});
  }
}
