import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/switch/switch_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'switch_style.dart';

part 'switch.describe.dart';

class ImpaktfullUiSwitch extends StatelessWidget with ComponentDescriptorMixin {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final ImpaktfullUiSwitchTheme? theme;

  const ImpaktfullUiSwitch({
    required this.value,
    required this.onChanged,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiSwitchTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) {
        final color = value
            ? componentTheme.colors.active
            : componentTheme.colors.inactive;
        final backgroundColor = value
            ? componentTheme.colors.activeBackgroundColor
            : componentTheme.colors.inactiveBackgroundColor;
        final borderWidth = componentTheme.dimens.borderWidth;
        return Opacity(
          opacity: onChanged == null ? 0.5 : 1,
          child: ImpaktfullUiTouchFeedback(
            onTap: onChanged == null ? null : () => onChanged!.call(!value),
            color: backgroundColor,
            borderRadius: componentTheme.dimens.borderRadius,
            child: AnimatedContainer(
              duration: theme.durations.short,
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: componentTheme.dimens.borderRadius,
                border: borderWidth == null
                    ? null
                    : Border.all(
                        color: color,
                        width: borderWidth,
                      ),
              ),
              child: AnimatedPadding(
                padding: EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  right: value ? 4 : 20,
                  left: value ? 20 : 4,
                ),
                curve: Curves.easeInOut,
                duration: theme.durations.short,
                child: AnimatedContainer(
                  duration: theme.durations.short,
                  curve: Curves.easeInOut,
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: componentTheme.dimens.thumbBorderRadius,
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      AnimatedOpacity(
                        opacity:
                            MediaQuery.of(context).accessibleNavigation && value
                                ? 1
                                : 0,
                        duration: theme.durations.short,
                        curve: Curves.easeInOut,
                        child: ImpaktfullUiAssetWidget(
                          asset: componentTheme.assets.active,
                          color: componentTheme.colors.activeBackgroundColor,
                          size: 12,
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: MediaQuery.of(context).accessibleNavigation &&
                                !value
                            ? 1
                            : 0,
                        duration: theme.durations.short,
                        curve: Curves.easeInOut,
                        child: ImpaktfullUiAssetWidget(
                          asset: componentTheme.assets.inactive,
                          color: componentTheme.colors.inactiveBackgroundColor,
                          size: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}