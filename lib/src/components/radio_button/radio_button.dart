import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/radio_button/radio_button_style.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'radio_button_style.dart';

class ImpaktfullUiRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T>? onChanged;
  final ImpaktfullUiRadioButtonTheme? theme;

  bool get isSelected => value == groupValue;

  const ImpaktfullUiRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => SizedBox(
        width: 20,
        height: 20,
        child: ImpaktfullUiTouchFeedback(
          borderRadius: componentTheme.dimens.borderRadius,
          color: isSelected
              ? componentTheme.colors.selected
              : componentTheme.colors.unselected,
          border: Border.all(
            color: componentTheme.colors.border,
            width: 1,
          ),
          onTap: onChanged == null ? null : () => onChanged!(value),
          child: Padding(
            padding: const EdgeInsets.all(6),
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
    );
  }
}
