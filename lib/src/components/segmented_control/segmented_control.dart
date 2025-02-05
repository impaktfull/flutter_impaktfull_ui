import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/segmented_control/segmented_control_style.dart';
import 'package:impaktfull_ui/src/components/segmented_control/widget/segment_control_item.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'segmented_control_style.dart';

part 'segmented_control.describe.dart';

class ImpaktfullUiSegmentedControl<T> extends StatelessWidget
    with ComponentDescriptorMixin {
  final T value;
  final List<T> items;
  final Widget Function(BuildContext context, T item)? leadingBuilder;
  final Widget Function(BuildContext context, T item)? trailingBuilder;
  final String Function(BuildContext context, T item)? labelBuilder;
  final ValueChanged<T> onChanged;
  final ImpaktfullUiSegmentedControlTheme? theme;

  const ImpaktfullUiSegmentedControl({
    required this.value,
    required this.items,
    required this.onChanged,
    this.leadingBuilder,
    this.labelBuilder,
    this.trailingBuilder,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiSegmentedControlTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Container(
        padding: componentTheme.dimens.padding,
        height: 56,
        decoration: BoxDecoration(
          color: componentTheme.colors.background,
          borderRadius: componentTheme.dimens.borderRadius,
          border: Border.all(color: componentTheme.colors.border),
        ),
        child: Stack(
          children: [
            // Animated selection indicator
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              alignment: Alignment(
                -1 + (2 * items.indexOf(value) / (items.length - 1)),
                0,
              ),
              child: FractionallySizedBox(
                widthFactor: 1 / items.length,
                child: Container(
                  margin: EdgeInsets.only(
                    left: items.indexOf(value) == 0 ? 0 : 2,
                    right: items.indexOf(value) == items.length - 1 ? 0 : 2,
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
            // Segments
            ImpaktfullUiAutoLayout.horizontal(
              spacing: 4,
              children: items.map((item) {
                final leading = leadingBuilder?.call(context, item);
                final trailing = trailingBuilder?.call(context, item);
                var label = labelBuilder?.call(context, item);
                if (label == null && item is String) {
                  label = item;
                }
                if (label == null) {
                  throw ArgumentError(
                      'No item builder provided and item is not a String');
                }
                return Expanded(
                  child: GestureDetector(
                    onTap: () => onChanged(item),
                    child: ImpaktfullUiSegmentControlItem(
                      onTap: () => onChanged(item),
                      isSelected: value == item,
                      leading: leading,
                      label: label,
                      trailing: trailing,
                      theme: componentTheme,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
