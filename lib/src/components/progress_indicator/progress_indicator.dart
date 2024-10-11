import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/progress_indicator/progress_indicator.dart';
import 'package:impaktfull_ui_2/src/components/progress_indicator/widget/half_cirlce_progress_indicator.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'progress_indicator_style.dart';
export 'model/progress_indicator_type.dart';
export 'widget/cirlce_progress_indicator.dart';
export 'widget/line_progress_indicator.dart';

part 'progress_indicator.describe.dart';

class ImpaktfullUiProgressIndicator extends StatelessWidget
    with ComponentDescriptorMixin {
  final double value;
  final bool showText;
  final ImpaktfullUiProgressIndicatorType type;
  final ImpaktfullUiProgressIndicatorTheme? theme;

  const ImpaktfullUiProgressIndicator({
    required this.value,
    this.type = ImpaktfullUiProgressIndicatorType.line,
    this.showText = false,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<
        ImpaktfullUiProgressIndicatorTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        switch (type) {
          case ImpaktfullUiProgressIndicatorType.line:
            return ImpaktfullUiLineProgressIndicator(
              value: value,
              showText: showText,
              theme: componentTheme,
            );
          case ImpaktfullUiProgressIndicatorType.circle:
            return ImpaktfullUiCircleProgressIndicator(
              value: value,
              showText: showText,
              theme: componentTheme,
            );
          case ImpaktfullUiProgressIndicatorType.halfCircle:
            return ImpaktfullUiHalfCircleProgressIndicator(
              value: value,
              showText: showText,
              theme: componentTheme,
            );
        }
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}