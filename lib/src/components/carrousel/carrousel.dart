import 'dart:async';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/carrousel/carrousel_style.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component.dart';

export 'carrousel_style.dart';

part 'carrousel.describe.dart';

const _pageTransitionDuration = Duration(milliseconds: 300);

class ImpaktfullUiCarrousel extends StatefulWidget
    with ComponentDescriptorMixin {
  final List<Widget> items;
  final int index;
  final EdgeInsetsGeometry? itemMargin;
  final ValueChanged<int>? onItemChanged;
  final ImpaktfullUiCarrouselTheme? theme;
  final bool autoplay;
  final bool loop;
  final Duration autoplayInterval;

  const ImpaktfullUiCarrousel({
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
  State<ImpaktfullUiCarrousel> createState() => _ImpaktfullUiCarrouselState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiCarrouselState extends State<ImpaktfullUiCarrousel> {
  late PageController _pageController;
  late int _currentPage;
  bool _isForward = true;
  Timer? _autoplayTimer;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.index;
    _pageController = PageController(
      initialPage: widget.index,
    );
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
    if (widget.autoplay) {
      _autoplayTimer = Timer.periodic(widget.autoplayInterval, (_) {
        if (widget.items.length < 2) return;
        if (widget.loop) {
          final nextPage = (_currentPage + 1) % widget.items.length;
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
  void didUpdateWidget(ImpaktfullUiCarrousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      _pageController.animateToPage(
        widget.index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
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
          if (widget.items.length > 1)
            Row(
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
                    borderRadius: componentTheme.dimens.indicatorBorderRadius,
                    color: _currentPage == index
                        ? componentTheme.colors.activeIndicator
                        : componentTheme.colors.inactiveIndicator,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
