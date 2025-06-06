import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/tab_bar/tab_bar_style.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'tab_bar_style.dart';

part 'tab_bar.describe.dart';

class ImpaktfullUiTabBar extends StatefulWidget with ComponentDescriptorMixin {
  final TabController controller;
  final List<Widget> items;
  final ImpaktfullUiTabBarTheme? theme;

  const ImpaktfullUiTabBar({
    required this.controller,
    required this.items,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiTabBar> createState() => _ImpaktfullUiTabBarState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiTabBarState extends State<ImpaktfullUiTabBar> {
  @override
  void initState() {
    widget.controller.addListener(_onTabChanged);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTabChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => Builder(
        builder: (context) => ImpaktfullUiAutoLayout.horizontal(
          mainAxisSize: MainAxisSize.min,
          children: widget.items
              .map(
                (item) => Expanded(child: item),
              )
              .toList(),
        ),
      ),
    );
  }

  void _onTabChanged() => setState(() {});
}
