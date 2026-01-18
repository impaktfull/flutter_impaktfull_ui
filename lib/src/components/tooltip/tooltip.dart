import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/tooltip/tooltip_style.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'tooltip_style.dart';

enum ImpaktfullUiTooltipTriggerMode {
  tap,
  longTap;
}

class ImpaktfullUiTooltip extends StatelessWidget {
  final String? message;
  final Widget child;
  final ImpaktfullUiTooltipTriggerMode triggerMode;
  final ImpaktfullUiTooltipTheme? theme;

  const ImpaktfullUiTooltip({
    required this.message,
    required this.child,
    this.triggerMode = ImpaktfullUiTooltipTriggerMode.longTap,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        if (message == null) {
          return child;
        }
        return Tooltip(
          waitDuration: componentTheme.durations.wait,
          message: message,
          textAlign: TextAlign.center,
          triggerMode: _getTriggerMode(),
          decoration: BoxDecoration(
            color: componentTheme.colors.background,
            borderRadius: componentTheme.dimens.borderRadius,
          ),
          child: child,
        );
      },
    );
  }

  TooltipTriggerMode _getTriggerMode() {
    switch (triggerMode) {
      case ImpaktfullUiTooltipTriggerMode.longTap:
        return TooltipTriggerMode.longPress;
      case ImpaktfullUiTooltipTriggerMode.tap:
        return TooltipTriggerMode.tap;
    }
  }
}
