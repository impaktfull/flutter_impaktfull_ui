import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/progress_indicator/progress_indicator.dart';
import 'package:impaktfull_ui/src/components/progress_indicator/widget/progress_indicator_semantics.dart';
import 'package:impaktfull_ui/src/util/animation/animation_util.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiLineProgressIndicator extends StatelessWidget {
  final double value;
  final bool showText;
  final Color? color;
  final double? width;
  final bool animate;
  final ImpaktfullUiProgressIndicatorTheme? theme;

  /// What screen readers announce before the percentage, e.g.
  /// `Upload progress`. Defaults to
  /// `ImpaktfullUiAccessibilityLocalizations.progress`.
  final String? semanticLabel;

  const ImpaktfullUiLineProgressIndicator({
    required this.value,
    this.showText = false,
    this.color,
    this.width,
    this.animate = true,
    this.theme,
    this.semanticLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) =>
          ImpaktfullUiProgressIndicatorSemantics(
        value: value,
        semanticLabel: semanticLabel,
        child: ImpaktfullUiAutoLayout.horizontal(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: componentTheme.dimens.spacing,
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Container(
                    height: width ?? componentTheme.dimens.width,
                    decoration: BoxDecoration(
                      color: componentTheme.colors.background,
                      borderRadius: componentTheme.dimens.borderRadius,
                      border: Border.all(color: componentTheme.colors.border),
                    ),
                    alignment: AlignmentDirectional.centerStart,
                  ),
                  TweenAnimationBuilder<double>(
                    duration: animate
                        ? ImpaktfullUiAnimationUtil.duration(
                            context, componentTheme.durations.progress)
                        : Duration.zero,
                    curve: Curves.easeInOut,
                    tween: Tween(begin: 0, end: value),
                    builder: (context, animatedValue, child) =>
                        FractionallySizedBox(
                      widthFactor: animatedValue,
                      child: Container(
                        height: width ?? componentTheme.dimens.width,
                        decoration: BoxDecoration(
                          color: color ?? componentTheme.colors.foreground,
                          borderRadius: componentTheme.dimens.borderRadius,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (showText) ...[
              Text(
                ImpaktfullUiLocaleUtil.formatPercentage(context, value),
                style: componentTheme.textStyles.text,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
