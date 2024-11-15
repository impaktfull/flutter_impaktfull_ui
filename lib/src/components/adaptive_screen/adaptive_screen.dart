import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/adaptive_nav_bar/adaptive_nav_bar.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/responsive_layout/responsive_layout.dart';
import 'package:impaktfull_ui_2/src/components/screen/screen.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

part 'adaptive_screen.describe.dart';

class ImpaktfullUiAdaptiveScreen extends StatelessWidget
    with ComponentDescriptorMixin {
  final String? title;
  final String? badge;
  final String? subtitle;
  final VoidCallback? onBackTapped;
  final List<ImpaktfullUiAdaptiveNavBarActionItem> actions;
  final bool isDrawerEnabled;
  final Widget? drawer;
  final Widget? headerBottomChild;
  final WidgetBuilder builder;
  final WidgetBuilder? mediumBuilder;
  final WidgetBuilder? largeBuilder;
  final WidgetBuilder? extraLargeBuilder;

  const ImpaktfullUiAdaptiveScreen({
    required this.builder,
    this.title,
    this.subtitle,
    this.onBackTapped,
    this.badge,
    this.isDrawerEnabled = false,
    this.drawer,
    this.headerBottomChild,
    this.mediumBuilder,
    this.largeBuilder,
    this.extraLargeBuilder,
    this.actions = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiScreen(
      drawer: drawer,
      child: Builder(
        builder: (context) => ClipRect(
          child: ImpaktfullUiAutoLayout.vertical(
            children: [
              ImpaktfullUiAdaptiveNavBar(
                title: title,
                subtitle: subtitle,
                badge: badge,
                bottomChild: headerBottomChild,
                onBackTapped: onBackTapped,
                isDrawerOpen: isDrawerEnabled
                    ? ImpaktfullUiScreen.of(context).isDrawerOpen
                    : false,
                onDrawerTapped: isDrawerEnabled
                    ? ImpaktfullUiScreen.of(context).openDrawer
                    : null,
                actions: actions,
              ),
              Expanded(
                child: ImpaktfullUiResponsiveLayout(
                  small: builder,
                  medium: mediumBuilder,
                  large: largeBuilder,
                  extraLarge: extraLargeBuilder,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
