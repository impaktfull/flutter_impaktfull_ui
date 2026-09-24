import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/switch/switch_style.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/util/animation/animation_util.dart';
import 'package:impaktfull_ui/src/widget/accessibility/min_tap_target.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'switch_style.dart';

class ImpaktfullUiSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final ImpaktfullUiSwitchTheme? theme;

  /// What screen readers announce for the switch, e.g. `Notifications`.
  ///
  /// Not needed in an `ImpaktfullUiSwitchListItem`: the title of the list
  /// item is the label.
  final String? semanticLabel;

  const ImpaktfullUiSwitch({
    required this.value,
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
      builder: (context, componentTheme) {
        final color = value
            ? componentTheme.colors.active
            : componentTheme.colors.inactive;
        final backgroundColor = value
            ? componentTheme.colors.activeBackground
            : componentTheme.colors.inactiveBackground;
        final borderWidth = componentTheme.dimens.borderWidth;
        final duration = ImpaktfullUiAnimationUtil.duration(
            context, componentTheme.durations.selected);
        final onTap = onChanged == null ? null : () => onChanged!.call(!value);
        return Semantics(
          container: true,
          toggled: value,
          enabled: onChanged != null,
          label: semanticLabel,
          child: ImpaktfullUiMinTapTarget(
            minSize: componentTheme.dimens.minTapTargetSize,
            onTap: onTap,
            child: Opacity(
              opacity: onChanged == null ? 0.5 : 1,
              child: ImpaktfullUiTouchFeedback(
                onTap: onTap,
                color: backgroundColor,
                borderRadius: componentTheme.dimens.borderRadius,
                child: AnimatedContainer(
                  duration: duration,
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
                    padding: EdgeInsetsDirectional.only(
                      top: componentTheme.dimens.verticalPadding,
                      bottom: componentTheme.dimens.verticalPadding,
                      end: value
                          ? componentTheme.dimens.verticalPadding
                          : componentTheme.dimens.horizontalPadding,
                      start: value
                          ? componentTheme.dimens.horizontalPadding
                          : componentTheme.dimens.verticalPadding,
                    ),
                    curve: Curves.easeInOut,
                    duration: duration,
                    child: AnimatedContainer(
                      duration: duration,
                      curve: Curves.easeInOut,
                      height: componentTheme.dimens.thumbSize,
                      width: componentTheme.dimens.thumbSize,
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
                                MediaQuery.accessibleNavigationOf(context) &&
                                        value
                                    ? 1
                                    : 0,
                            duration: duration,
                            curve: Curves.easeInOut,
                            child: ImpaktfullUiAssetWidget(
                              asset: componentTheme.assets.active,
                              color: componentTheme.colors.accessibleActiveIcon,
                              size: componentTheme.dimens.iconSize,
                            ),
                          ),
                          AnimatedOpacity(
                            opacity:
                                MediaQuery.accessibleNavigationOf(context) &&
                                        !value
                                    ? 1
                                    : 0,
                            duration: duration,
                            curve: Curves.easeInOut,
                            child: ImpaktfullUiAssetWidget(
                              asset: componentTheme.assets.inactive,
                              color:
                                  componentTheme.colors.accessibleInactiveIcon,
                              size: componentTheme.dimens.iconSize,
                            ),
                          ),
                        ],
                      ),
                    ),
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
