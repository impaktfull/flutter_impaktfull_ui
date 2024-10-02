import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/checkbox/checkbox_style.dart';
import 'package:impaktfull_ui_2/src/components/checkbox/checkbox_type.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'checkbox_style.dart';

part 'checkbox.describe.dart';

class ImpaktfullUiCheckBox extends StatelessWidget
    with ComponentDescriptorMixin {
  final CheckboxType type;
  final bool? value;
  final ValueChanged<bool>? onChanged;
  final ValueChanged<bool?>? onChangedInterpediate;
  final ImpaktfullUiCheckboxTheme? theme;

  const ImpaktfullUiCheckBox({
    required bool this.value,
    required this.onChanged,
    this.theme,
    super.key,
  })  : type = CheckboxType.normal,
        onChangedInterpediate = null;

  const ImpaktfullUiCheckBox.indermediate({
    required this.value,
    required ValueChanged<bool?> onChanged,
    this.theme,
    super.key,
  })  : onChangedInterpediate = onChanged,
        onChanged = null,
        type = CheckboxType.indeterminate;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == null || value == true;
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCheckboxTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => Center(
        child: ImpaktfullUiTouchFeedback(
          onTap: _onTap,
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
                    duration: theme.durations.short,
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
                      duration: theme.durations.short,
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
                        asset: componentTheme.assets.indermediate,
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

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

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
    } else if (onChangedInterpediate != null) {
      onChangedInterpediate?.call(value);
    }
  }
}
