import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/checkbox/checkbox_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'checkbox_style.dart';

part 'checkbox.describe.dart';

class ImpaktfullUiCheckBox extends StatelessWidget with ComponentDescriptorMixin {
  final bool value;
  final ValueChanged<bool> onChanged;
  final ImpaktfullUiCheckboxTheme? theme;

  const ImpaktfullUiCheckBox({
    required this.value,
    required this.onChanged,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCheckboxTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => Center(
        child: ImpaktfullUiTouchFeedback(
          onTap: () => onChanged(!value),
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
                        color: componentTheme.colors.activeColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: AnimatedOpacity(
                    duration: theme.durations.short,
                    curve: Curves.easeInOut,
                    opacity: value ? 1 : 0,
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
                Positioned.fill(
                  child: AnimatedOpacity(
                    duration: theme.durations.short,
                    curve: Curves.easeInOut,
                    opacity: value ? 1 : 0,
                    child: Center(
                      child: Icon(
                        theme.assets.icons.check,
                        color: componentTheme.colors.checkMarkColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(ImpaktfullUiCheckboxTheme theme) {
    if (value) return theme.colors.activeColor;
    return theme.colors.backgroundColor;
  }

  @override
  String describe() => _describeInstance(this);
}
