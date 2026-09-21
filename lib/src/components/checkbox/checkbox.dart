import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/checkbox/checkbox_style.dart';
import 'package:impaktfull_ui/src/components/checkbox/checkbox_type.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'checkbox_style.dart';

class ImpaktfullUiCheckbox extends StatelessWidget {
  final CheckboxType type;
  final bool? value;
  final ValueChanged<bool>? onChanged;
  final ValueChanged<bool?>? onChangedIndeterminate;
  final ImpaktfullUiCheckboxTheme? theme;

  const ImpaktfullUiCheckbox({
    required bool this.value,
    required this.onChanged,
    this.theme,
    super.key,
  })  : type = CheckboxType.normal,
        onChangedIndeterminate = null;

  const ImpaktfullUiCheckbox.indeterminate({
    required this.value,
    required ValueChanged<bool?>? onChanged,
    this.theme,
    super.key,
  })  : onChangedIndeterminate = onChanged,
        onChanged = null,
        type = CheckboxType.indeterminate;

  @Deprecated(
      'Use ImpaktfullUiCheckbox.indeterminate instead. Will be removed in 1.0.0.')
  const ImpaktfullUiCheckbox.indermediate({
    required bool? value,
    required ValueChanged<bool?>? onChanged,
    ImpaktfullUiCheckboxTheme? theme,
    Key? key,
  }) : this.indeterminate(
          value: value,
          onChanged: onChanged,
          theme: theme,
          key: key,
        );

  @Deprecated('Use onChangedIndeterminate instead. Will be removed in 1.0.0.')
  ValueChanged<bool?>? get onChangedInterpediate => onChangedIndeterminate;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == null || value == true;
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Center(
        child: ImpaktfullUiTouchFeedback(
          onTap: _isDisabled ? null : _onTap,
          borderRadius: componentTheme.dimens.borderRadius,
          color: _getBackgroundColor(componentTheme),
          child: SizedBox(
            width: 24,
            height: 24,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: componentTheme.dimens.borderRadius,
                      border: Border.all(
                        color: componentTheme.colors.borderColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: AnimatedOpacity(
                    duration: componentTheme.durations.selected,
                    curve: Curves.easeInOut,
                    opacity: isSelected ? 1 : 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: componentTheme.dimens.borderRadius,
                        border: Border.all(
                          color: componentTheme.colors.activeColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                if (value == true) ...[
                  Positioned.fill(
                    child: AnimatedOpacity(
                      duration: componentTheme.durations.selected,
                      curve: Curves.easeInOut,
                      opacity: isSelected ? 1 : 0,
                      child: Center(
                        child: ImpaktfullUiAssetWidget(
                          asset: componentTheme.assets.check,
                          color: componentTheme.colors.checkMarkColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ] else if (type == CheckboxType.indeterminate &&
                    value == null) ...[
                  Positioned.fill(
                    child: Center(
                      child: ImpaktfullUiAssetWidget(
                        asset: componentTheme.assets.indeterminate,
                        color: componentTheme.colors.checkMarkColor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(ImpaktfullUiCheckboxTheme theme) {
    final isSelected = value == null || value == true;
    if (isSelected) return theme.colors.activeColor;
    return theme.colors.backgroundColor;
  }

  bool get _isDisabled => onChanged == null && onChangedIndeterminate == null;

  void _onTap() {
    if (value == true) {
      _onChanged(false);
    } else {
      _onChanged(true);
    }
  }

  void _onChanged(bool value) {
    if (onChanged != null) {
      onChanged?.call(value);
    } else if (onChangedIndeterminate != null) {
      onChangedIndeterminate?.call(value);
    }
  }
}
