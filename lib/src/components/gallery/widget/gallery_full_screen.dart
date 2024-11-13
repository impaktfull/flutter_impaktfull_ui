import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_2/src/components/gallery/widget/gallery_full_screen_item.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiGalleryFullScreen extends StatefulWidget {
  final List<ImpaktfullUiGalleryItem> items;
  final ImpaktfullUiGalleryItem initialItem;
  final ImpaktfullUiGalleryTheme theme;

  const ImpaktfullUiGalleryFullScreen({
    required this.items,
    required this.initialItem,
    required this.theme,
    super.key,
  });
  static void show({
    required BuildContext context,
    required ImpaktfullUiGalleryTheme componentTheme,
    required List<ImpaktfullUiGalleryItem> items,
    required ImpaktfullUiGalleryItem initialItem,
    bool barrierDismissible = true,
  }) =>
      Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          barrierDismissible: barrierDismissible,
          pageBuilder: (context, _, __) => ImpaktfullUiGalleryFullScreen(
            items: items,
            initialItem: initialItem,
            theme: componentTheme,
          ),
        ),
      );

  @override
  State<ImpaktfullUiGalleryFullScreen> createState() =>
      _ImpaktfullUiGalleryFullScreenState();
}

class _ImpaktfullUiGalleryFullScreenState
    extends State<ImpaktfullUiGalleryFullScreen> {
  late PageController _pageController;
  late int _currentIndex;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.items.indexOf(widget.initialItem);
    _pageController = PageController(initialPage: _currentIndex);
    _focusNode = FocusNode();
    _focusNode.requestFocus();
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiGalleryFullScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialItem != widget.initialItem) {
      _currentIndex = widget.items.indexOf(widget.initialItem);
      _pageController.jumpTo(_currentIndex.toDouble());
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            _onTapPrevious(widget.theme);
          } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            _onTapNext(widget.theme);
          }
        }
      },
      child: ImpaktfullUiComponentThemeBuilder(
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
                return ImpaktfullUiGalleryFullScreenItemWidget(
                  item: item,
                  theme: componentTheme,
                );
              },
            ),
            Positioned(
              top: 16,
              right: 16,
              child: ImpaktfullUiIconButton(
                onTap: () => Navigator.of(context).pop(),
                asset: componentTheme.assets.close,
                color: componentTheme.colors.icons,
                tooltip: 'Close fullscreen',
              ),
            ),
            if (_currentIndex > 0)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16),
                  child: ImpaktfullUiIconButton(
                    onTap: () => _onTapPrevious(componentTheme),
                    backgroundColor: componentTheme.colors.iconButtonBackground,
                    asset: componentTheme.assets.arrowLeft,
                    tooltip: 'Previous',
                    color: componentTheme.colors.icons,
                  ),
                ),
              ),
            if (_currentIndex < widget.items.length - 1)
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: ImpaktfullUiIconButton(
                    onTap: () => _onTapNext(componentTheme),
                    backgroundColor: componentTheme.colors.iconButtonBackground,
                    asset: componentTheme.assets.arrowRight,
                    tooltip: 'Next',
                    color: componentTheme.colors.icons,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _onPageChanged(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  void _onTapPrevious(ImpaktfullUiGalleryTheme componentTheme) {
    if (_currentIndex <= 0) return;
    _pageController.previousPage(
      duration: componentTheme.durations.pageTransition,
      curve: Curves.easeInOut,
    );
  }

  void _onTapNext(ImpaktfullUiGalleryTheme componentTheme) {
    if (_currentIndex >= widget.items.length - 1) return;
    _pageController.nextPage(
      duration: componentTheme.durations.pageTransition,
      curve: Curves.easeInOut,
    );
  }
}
