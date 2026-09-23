import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/segmented_control/segmented_control_style.dart';
import 'package:impaktfull_ui/src/components/segmented_control/widget/segmented_control_item.dart';
import 'package:impaktfull_ui/src/util/animation/animation_util.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'segmented_control_style.dart';

class ImpaktfullUiSegmentedControl<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final Widget Function(BuildContext context, T item)? leadingBuilder;
  final Widget Function(BuildContext context, T item)? trailingBuilder;
  final String Function(BuildContext context, T item)? titleBuilder;
  final ValueChanged<T> onChanged;
  final ImpaktfullUiSegmentedControlTheme? theme;

  const ImpaktfullUiSegmentedControl({
    required this.value,
    required this.items,
    required this.onChanged,
    this.leadingBuilder,
    String Function(BuildContext context, T item)? titleBuilder,
    @Deprecated('Use titleBuilder instead. Will be removed in 1.0.0.')
    String Function(BuildContext context, T item)? labelBuilder,
    this.trailingBuilder,
    this.theme,
    super.key,
  }) : titleBuilder = titleBuilder ?? labelBuilder;

  @Deprecated('Use titleBuilder instead. Will be removed in 1.0.0.')
  String Function(BuildContext context, T item)? get labelBuilder =>
      titleBuilder;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = items.indexOf(value);
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Container(
        padding: componentTheme.dimens.padding,
        height: componentTheme.dimens.height,
        decoration: BoxDecoration(
          color: componentTheme.colors.background,
          borderRadius: componentTheme.dimens.borderRadius,
          border: Border.all(color: componentTheme.colors.border),
        ),
        child: Stack(
          children: [
            // Animated selection indicator, hidden when the value is not
            // one of the items.
            if (selectedIndex != -1) ...[
              AnimatedAlign(
                duration: ImpaktfullUiAnimationUtil.duration(
                    context, componentTheme.durations.selected),
                curve: Curves.easeInOut,
                alignment: AlignmentDirectional(
                  items.length == 1
                      ? 0
                      : -1 + (2 * selectedIndex / (items.length - 1)),
                  0,
                ),
                child: FractionallySizedBox(
                  widthFactor: 1 / items.length,
                  child: Container(
                    margin: EdgeInsetsDirectional.only(
                      start: selectedIndex == 0 ? 0 : 2,
                      end: selectedIndex == items.length - 1 ? 0 : 2,
                    ),
                    decoration: BoxDecoration(
                      color: componentTheme.colors.activeBackground,
                      borderRadius: componentTheme.dimens.borderRadius,
                      border:
                          Border.all(color: componentTheme.colors.activeBorder),
                    ),
                  ),
                ),
              ),
            ],
            // Segments
            ImpaktfullUiAutoLayout.horizontal(
              spacing: 4,
              children: items.map((item) {
                final leading = leadingBuilder?.call(context, item);
                final trailing = trailingBuilder?.call(context, item);
                final label =
                    titleBuilder?.call(context, item) ?? item.toString();
                return Expanded(
                  child: ImpaktfullUiSegmentedControlItem(
                    onTap: () => onChanged(item),
                    isSelected: value == item,
                    leading: leading,
                    label: label,
                    trailing: trailing,
                    theme: componentTheme,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
