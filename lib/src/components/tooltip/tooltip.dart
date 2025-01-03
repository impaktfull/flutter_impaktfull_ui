import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/tooltip/tooltip_style.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'tooltip_style.dart';

part 'tooltip.describe.dart';

class ImpaktfullUiTooltip extends StatelessWidget
    with ComponentDescriptorMixin {
  final String? message;
  final Widget child;
  final ImpaktfullUiTooltipTheme? theme;

  const ImpaktfullUiTooltip({
    required this.message,
    required this.child,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiTooltipTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        if (message == null) {
          return child;
        }
        return Tooltip(
          waitDuration: componentTheme.durations.wait,
          message: message,
          decoration: BoxDecoration(
            color: componentTheme.colors.background,
            borderRadius: componentTheme.dimens.borderRadius,
          ),
          child: child,
        );
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
