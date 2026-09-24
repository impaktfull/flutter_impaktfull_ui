import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/tab_bar_item/tab_bar_item_style.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/util/animation/animation_util.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'tab_bar_item_style.dart';

class ImpaktfullUiTabBarItem extends StatefulWidget {
  final String title;
  final int index;
  final TabController controller;
  final ImpaktfullUiTabBarItemTheme? theme;

  const ImpaktfullUiTabBarItem({
    // `title` becomes `required` again in 1.0.0, when `label` is removed.
    String? title,
    @Deprecated('Use title instead. Will be removed in 1.0.0.') String? label,
    required this.index,
    required this.controller,
    this.theme,
    super.key,
  })  : assert(title != null || label != null, 'title is required'),
        title = (title ?? label) as String;

  @Deprecated('Use title instead. Will be removed in 1.0.0.')
  String get label => title;

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
  void didUpdateWidget(covariant ImpaktfullUiTabBarItem oldWidget) {
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
      builder: (context, componentTheme) {
        final colors = componentTheme.colors;
        final dimens = componentTheme.dimens;
        final isSelected = widget.index == widget.controller.index;
        final textStyle = isSelected
            ? componentTheme.textStyles.selectedLabel ??
                componentTheme.textStyles.label
            : componentTheme.textStyles.label;
        return Semantics(
          container: true,
          role: SemanticsRole.tab,
          button: true,
          selected: isSelected,
          child: ImpaktfullUiTouchFeedback(
            useFocusColor: false,
            borderRadius: dimens.borderRadius,
            onTap: () => widget.controller.animateTo(
              widget.index,
              duration: ImpaktfullUiAnimationUtil.reduceMotion(context)
                  ? Duration.zero
                  : null,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? colors.selectedBackground ?? colors.background
                    : colors.background,
                borderRadius: dimens.borderRadius,
              ),
              padding: dimens.padding,
              child: ImpaktfullUiAutoLayout.vertical(
                spacing: dimens.spacing,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: textStyle,
                  ),
                  AnimatedOpacity(
                    opacity: isSelected ? 1 : 0,
                    duration: ImpaktfullUiAnimationUtil.duration(
                        context, componentTheme.durations.selected),
                    curve: Curves.easeInOut,
                    child: Container(
                      height: dimens.selectedMarkerHeight,
                      width: dimens.selectedMarkerWidth ?? double.infinity,
                      decoration: BoxDecoration(
                        color: colors.selectedMarker ?? textStyle.color,
                        borderRadius: dimens.selectedMarkerBorderRadius,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onTabChanged() => setState(() {});
}
