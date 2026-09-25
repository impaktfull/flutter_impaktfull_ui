import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/tab_bar/tab_bar_style.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'tab_bar_style.dart';

class ImpaktfullUiTabBar extends StatefulWidget {
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
}

class _ImpaktfullUiTabBarState extends State<ImpaktfullUiTabBar> {
  @override
  void initState() {
    widget.controller.addListener(_onTabChanged);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onTabChanged);
      widget.controller.addListener(_onTabChanged);
    }
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
        builder: (context) => _buildBar(componentTheme),
      ),
    );
  }

  Widget _buildBar(ImpaktfullUiTabBarTheme componentTheme) {
    final colors = componentTheme.colors;
    final dimens = componentTheme.dimens;
    final divider = colors.divider;
    Widget bar = SizedBox(
      height: dimens.height,
      child: Padding(
        padding: dimens.padding,
        child: ImpaktfullUiAutoLayout.horizontal(
          mainAxisSize: MainAxisSize.min,
          spacing: dimens.spacing,
          children: dimens.expandItems
              ? widget.items.map((item) => Expanded(child: item)).toList()
              : widget.items,
        ),
      ),
    );
    if (colors.background == null && divider == null) return bar;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: dimens.borderRadius,
        border: divider == null
            ? null
            : Border(
                bottom: BorderSide(
                  color: divider,
                  width: dimens.dividerHeight,
                ),
              ),
      ),
      child: bar,
    );
  }

  void _onTabChanged() => setState(() {});
}
