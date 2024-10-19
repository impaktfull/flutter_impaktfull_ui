import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/adaptive_nav_bar/adaptive_nav_bar.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/responsive_layout/responsive_layout.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

part 'adaptive_screen.describe.dart';

class ImpaktfullUiAdaptiveScreen extends StatelessWidget
    with ComponentDescriptorMixin {
  final String title;
  final String? subtitle;
  final VoidCallback? onBackTapped;
  final List<ImpaktfullUiAdaptiveNavBarActionItem> actions;
  final WidgetBuilder builder;
  final WidgetBuilder? mediumBuilder;
  final WidgetBuilder? largeBuilder;
  final WidgetBuilder? extraLargeBuilder;

  const ImpaktfullUiAdaptiveScreen({
    required this.title,
    required this.builder,
    this.mediumBuilder,
    this.largeBuilder,
    this.extraLargeBuilder,
    this.subtitle,
    this.onBackTapped,
    this.actions = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: ImpaktfullUiAutoLayout.vertical(
        children: [
          ImpaktfullUiAdaptiveNavBar(
            title: title,
            subtitle: subtitle,
            onBackTapped: onBackTapped,
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
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
