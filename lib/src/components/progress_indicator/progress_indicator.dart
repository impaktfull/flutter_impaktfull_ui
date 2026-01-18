import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/progress_indicator/progress_indicator.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'progress_indicator_style.dart';
export 'model/progress_indicator_type.dart';
export 'widget/cirlce_progress_indicator.dart';
export 'widget/half_cirlce_progress_indicator.dart';
export 'widget/line_progress_indicator.dart';

class ImpaktfullUiProgressIndicator extends StatelessWidget {
  final double value;
  final bool showText;
  final ImpaktfullUiProgressIndicatorType type;
  final Color? color;
  final double? width;
  final bool animate;
  final ImpaktfullUiProgressIndicatorTheme? theme;

  const ImpaktfullUiProgressIndicator({
    required this.value,
    this.type = ImpaktfullUiProgressIndicatorType.line,
    this.showText = false,
    this.color,
    this.animate = true,
    this.width,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        switch (type) {
          case ImpaktfullUiProgressIndicatorType.line:
            return ImpaktfullUiLineProgressIndicator(
              value: value,
              showText: showText,
              color: color,
              animate: animate,
              width: width,
              theme: componentTheme,
            );
          case ImpaktfullUiProgressIndicatorType.circle:
            return ImpaktfullUiCircleProgressIndicator(
              value: value,
              showText: showText,
              color: color,
              animate: animate,
              width: width,
              theme: componentTheme,
            );
          case ImpaktfullUiProgressIndicatorType.halfCircle:
            return ImpaktfullUiHalfCircleProgressIndicator(
              value: value,
              showText: showText,
              color: color,
              animate: animate,
              width: width,
              theme: componentTheme,
            );
        }
      },
    );
  }
}
