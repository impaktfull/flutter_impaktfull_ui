import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/radio_button/radio_button_style.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/widget/accessibility/min_tap_target.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'radio_button_style.dart';

class ImpaktfullUiRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T>? onChanged;
  final ImpaktfullUiRadioButtonTheme? theme;

  /// What screen readers announce for the radio button, e.g. `Monthly`.
  ///
  /// Not needed in an `ImpaktfullUiRadioButtonListItem`: the title of the
  /// list item is the label.
  final String? semanticLabel;

  bool get isSelected => value == groupValue;

  const ImpaktfullUiRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.theme,
    this.semanticLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Semantics(
        container: true,
        checked: isSelected,
        inMutuallyExclusiveGroup: true,
        enabled: onChanged != null,
        label: semanticLabel,
        child: ImpaktfullUiMinTapTarget(
          minSize: componentTheme.dimens.minTapTargetSize,
          onTap: onChanged == null ? null : () => onChanged!(value),
          child: SizedBox(
            width: componentTheme.dimens.size,
            height: componentTheme.dimens.size,
            child: ImpaktfullUiTouchFeedback(
              borderRadius: componentTheme.dimens.borderRadius,
              color: isSelected
                  ? componentTheme.colors.selected
                  : componentTheme.colors.unselected,
              border: Border.all(
                color: isSelected
                    ? componentTheme.colors.borderSelected ??
                        componentTheme.colors.border
                    : componentTheme.colors.border,
                width: componentTheme.dimens.borderWidth,
              ),
              onTap: onChanged == null ? null : () => onChanged!(value),
              child: Padding(
                padding: EdgeInsets.all(componentTheme.dimens.dotInset),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: componentTheme.dimens.borderRadius,
                    color: isSelected
                        ? componentTheme.colors.centerSelectedBackground
                        : componentTheme.colors.centerUnSelectedBackground,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
