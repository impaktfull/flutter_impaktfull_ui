import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/switch/switch_style.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'switch_style.dart';

class ImpaktfullUiSwitch extends StatelessWidget {
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
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final color = value
            ? componentTheme.colors.active
            : componentTheme.colors.inactive;
        final backgroundColor = value
            ? componentTheme.colors.activeBackground
            : componentTheme.colors.inactiveBackground;
        final borderWidth = componentTheme.dimens.borderWidth;
        return Opacity(
          opacity: onChanged == null ? 0.5 : 1,
          child: ImpaktfullUiTouchFeedback(
            onTap: onChanged == null ? null : () => onChanged!.call(!value),
            color: backgroundColor,
            borderRadius: componentTheme.dimens.borderRadius,
            child: AnimatedContainer(
              duration: componentTheme.durations.selected,
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: componentTheme.dimens.borderRadius,
                border: borderWidth == null
                    ? null
                    : Border.all(
                        color: componentTheme.colors.border,
                        width: borderWidth,
                      ),
              ),
              child: AnimatedPadding(
                padding: EdgeInsets.only(
                  top: componentTheme.dimens.verticalPadding,
                  bottom: componentTheme.dimens.verticalPadding,
                  right: value
                      ? componentTheme.dimens.verticalPadding
                      : componentTheme.dimens.horizontalPadding,
                  left: value
                      ? componentTheme.dimens.horizontalPadding
                      : componentTheme.dimens.verticalPadding,
                ),
                curve: Curves.easeInOut,
                duration: componentTheme.durations.selected,
                child: AnimatedContainer(
                  duration: componentTheme.durations.selected,
                  curve: Curves.easeInOut,
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: componentTheme.dimens.thumbBorderRadius,
                    border: borderWidth == null
                        ? null
                        : Border.all(
                            color: componentTheme.colors.border,
                            width: borderWidth,
                          ),
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      AnimatedOpacity(
                        opacity:
                            MediaQuery.accessibleNavigationOf(context) && value
                                ? 1
                                : 0,
                        duration: componentTheme.durations.selected,
                        curve: Curves.easeInOut,
                        child: ImpaktfullUiAssetWidget(
                          asset: componentTheme.assets.active,
                          color: componentTheme.colors.accessibleActiveIcon,
                          size: 12,
                        ),
                      ),
                      AnimatedOpacity(
                        opacity:
                            MediaQuery.accessibleNavigationOf(context) && !value
                                ? 1
                                : 0,
                        duration: componentTheme.durations.selected,
                        curve: Curves.easeInOut,
                        child: ImpaktfullUiAssetWidget(
                          asset: componentTheme.assets.inactive,
                          color: componentTheme.colors.accessibleInactiveIcon,
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
}
