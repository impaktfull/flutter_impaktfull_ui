import 'dart:async';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/util/accessibility/accessibility.localizations.dart';
import 'package:impaktfull_ui/src/util/animation/animation_util.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/carousel/carousel_style.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'carousel_style.dart';

const _pageTransitionDuration = Duration(milliseconds: 300);

class ImpaktfullUiCarousel extends StatefulWidget {
  final List<Widget> items;
  final int index;
  final EdgeInsetsGeometry? itemMargin;
  final ValueChanged<int>? onItemChanged;
  final ImpaktfullUiCarouselTheme? theme;
  final bool autoplay;
  final bool loop;
  final Duration autoplayInterval;

  const ImpaktfullUiCarousel({
    required this.items,
    this.itemMargin,
    this.index = 0,
    this.onItemChanged,
    this.theme,
    this.autoplay = false,
    this.loop = true,
    this.autoplayInterval = const Duration(seconds: 3),
    super.key,
  });

  @override
  State<ImpaktfullUiCarousel> createState() => _ImpaktfullUiCarouselState();
}

class _ImpaktfullUiCarouselState extends State<ImpaktfullUiCarousel> {
  late PageController _pageController;
  late int _currentPage;
  bool _isForward = true;
  bool _isUserDragging = false;
  Timer? _autoplayTimer;
  bool? _reduceMotion;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.index;
    _pageController = PageController(initialPage: widget.index);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduceMotion = ImpaktfullUiAnimationUtil.reduceMotion(context);
    if (reduceMotion == _reduceMotion) return;
    _reduceMotion = reduceMotion;
    _setupAutoplay();
  }

  @override
  void dispose() {
    _autoplayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _setupAutoplay() {
    _autoplayTimer?.cancel();
    _autoplayTimer = null;
    // No autoplay when the user asked to reduce motion.
    if (widget.autoplay && !_isUserDragging && _reduceMotion != true) {
      _autoplayTimer = Timer.periodic(widget.autoplayInterval, (_) {
        if (widget.items.length < 2) return;
        if (!_pageController.hasClients) return;
        if (widget.loop) {
          final nextPage = (_currentPage + 1) % widget.items.length;
          if (nextPage == 0) {
            // Jump back to the first page instead of animating back through
            // every page in between.
            _pageController.jumpToPage(nextPage);
            return;
          }
          _pageController.animateToPage(
            nextPage,
            duration: _pageTransitionDuration,
            curve: Curves.easeInOut,
          );
        } else {
          if (_isForward) {
            if (_currentPage < widget.items.length - 1) {
              _pageController.nextPage(
                duration: _pageTransitionDuration,
                curve: Curves.easeInOut,
              );
            } else {
              _isForward = false;
              _pageController.previousPage(
                duration: _pageTransitionDuration,
                curve: Curves.easeInOut,
              );
            }
          } else {
            if (_currentPage > 0) {
              _pageController.previousPage(
                duration: _pageTransitionDuration,
                curve: Curves.easeInOut,
              );
            } else {
              _isForward = true;
              _pageController.nextPage(
                duration: _pageTransitionDuration,
                curve: Curves.easeInOut,
              );
            }
          }
        }
      });
    }
  }

  @override
  void didUpdateWidget(ImpaktfullUiCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only animate when the page is not shown yet: a parent that passes the
    // index of `onItemChanged` back would otherwise interrupt the swipe of
    // the user.
    if (oldWidget.index != widget.index && widget.index != _currentPage) {
      if (_reduceMotion == true) {
        _pageController.jumpToPage(widget.index);
      } else {
        _pageController.animateToPage(
          widget.index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
    if (oldWidget.autoplay != widget.autoplay ||
        oldWidget.autoplayInterval != widget.autoplayInterval) {
      _setupAutoplay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: _onScrollNotification,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                  widget.onItemChanged?.call(index);
                },
                itemCount: widget.items.length,
                itemBuilder: (context, index) => Padding(
                  padding: widget.itemMargin ?? EdgeInsets.zero,
                  child: widget.items[index],
                ),
              ),
            ),
          ),
          if (widget.items.length > 1)
            // The dots are announced as the current slide.
            Semantics(
              container: true,
              liveRegion: true,
              label: ImpaktfullUiAccessibilityLocalizations.of(
                context,
              ).slideLabel(_currentPage + 1, widget.items.length),
              child: Padding(
                padding: componentTheme.dimens.indicatorPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    widget.items.length,
                    (index) => Container(
                      width: componentTheme.dimens.indicatorSize,
                      height: componentTheme.dimens.indicatorSize,
                      margin: componentTheme.dimens.indicatorSpacing,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: componentTheme.colors.indicatorBorder,
                        ),
                        borderRadius:
                            componentTheme.dimens.indicatorBorderRadius,
                        color: _currentPage == index
                            ? componentTheme.colors.activeIndicator
                            : componentTheme.colors.inactiveIndicator,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Pauses autoplay while the user drags the carousel, and restarts the
  /// interval once the user lets go.
  bool _onScrollNotification(ScrollNotification notification) {
    if (notification.depth != 0) return false;
    if (notification is ScrollStartNotification &&
        notification.dragDetails != null) {
      _isUserDragging = true;
      _autoplayTimer?.cancel();
      _autoplayTimer = null;
    } else if (notification is ScrollEndNotification && _isUserDragging) {
      _isUserDragging = false;
      _setupAutoplay();
    }
    return false;
  }
}
