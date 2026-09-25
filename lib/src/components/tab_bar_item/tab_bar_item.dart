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

  /// Whether the marker takes the whole width of the tab.
  bool _stretchMarker(ImpaktfullUiTabBarItemDimensTheme dimens) {
    final width = dimens.selectedMarkerWidth;
    return width == null || width == double.infinity;
  }

  /// The title of the tab with its marker under it.
  ///
  /// A marker of the width of the tab is painted over the space that is kept
  /// for it, instead of being a child of the column: a child that asks for
  /// every pixel is an error in a tab that is as wide as its title
  /// (`ImpaktfullUiTabBarDimensTheme.expandItems` is false), and a `stretch`
  /// needs a width to stretch to, which such a tab does not have either.
  Widget _buildContent(
    BuildContext context,
    ImpaktfullUiTabBarItemTheme componentTheme,
    TextStyle textStyle, {
    required bool isSelected,
  }) {
    final dimens = componentTheme.dimens;
    final colors = componentTheme.colors;
    final marker = AnimatedOpacity(
      opacity: isSelected ? 1 : 0,
      duration: ImpaktfullUiAnimationUtil.duration(
          context, componentTheme.durations.selected),
      curve: Curves.easeInOut,
      child: Container(
        height: dimens.selectedMarkerHeight,
        width: _stretchMarker(dimens) ? null : dimens.selectedMarkerWidth,
        decoration: BoxDecoration(
          color: colors.selectedMarker ?? textStyle.color,
          borderRadius: dimens.selectedMarkerBorderRadius,
        ),
      ),
    );
    final title = Text(
      widget.title,
      style: textStyle,
      textAlign: TextAlign.center,
    );
    if (!_stretchMarker(dimens)) {
      return ImpaktfullUiAutoLayout.vertical(
        spacing: dimens.spacing,
        crossAxisAlignment: CrossAxisAlignment.center,
        // A tab is as tall as the bar it sits in, which can be more than its
        // title needs (`ImpaktfullUiTabBarDimensTheme.height`). Without a
        // height on the bar the tab is as tall as its title and this changes
        // nothing.
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [title, marker],
      );
    }
    return Stack(
      children: [
        ImpaktfullUiAutoLayout.vertical(
          spacing: dimens.spacing,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            title,
            SizedBox(height: dimens.selectedMarkerHeight),
          ],
        ),
        PositionedDirectional(
          start: 0,
          end: 0,
          bottom: 0,
          child: marker,
        ),
      ],
    );
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
              child: _buildContent(
                context,
                componentTheme,
                textStyle,
                isSelected: isSelected,
              ),
            ),
          ),
        );
      },
    );
  }

  void _onTabChanged() => setState(() {});
}
