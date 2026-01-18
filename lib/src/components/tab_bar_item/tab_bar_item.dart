import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/tab_bar_item/tab_bar_item_style.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'tab_bar_item_style.dart';

class ImpaktfullUiTabBarItem extends StatefulWidget {
  final String label;
  final int index;
  final TabController controller;
  final ImpaktfullUiTabBarItemTheme? theme;

  const ImpaktfullUiTabBarItem({
    required this.label,
    required this.index,
    required this.controller,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiTabBarItem> createState() => _ImpaktfullUiTabBarItemState();
}

class _ImpaktfullUiTabBarItemState extends State<ImpaktfullUiTabBarItem> {
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
      builder: (context, componentTheme) => ImpaktfullUiTouchFeedback(
        useFocusColor: false,
        onTap: () => widget.controller.animateTo(widget.index),
        child: Container(
          color: componentTheme.colors.background,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: ImpaktfullUiAutoLayout.vertical(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: componentTheme.textStyles.label,
              ),
              AnimatedOpacity(
                opacity: widget.index == widget.controller.index ? 1 : 0,
                duration: componentTheme.durations.selected,
                curve: Curves.easeInOut,
                child: Container(
                  height: 4,
                  width: 4,
                  decoration: BoxDecoration(
                    color: componentTheme.textStyles.label.color,
                    borderRadius:
                        componentTheme.dimens.selectedMarkerBorderRadius,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTabChanged() => setState(() {});
}
