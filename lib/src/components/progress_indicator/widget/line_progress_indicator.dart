import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/progress_indicator/progress_indicator.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiLineProgressIndicator extends StatelessWidget {
  final double value;
  final bool showText;
  final ImpaktfullUiProgressIndicatorTheme? theme;

  const ImpaktfullUiLineProgressIndicator({
    required this.value,
    this.showText = false,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<
        ImpaktfullUiProgressIndicatorTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.horizontal(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Container(
                  height: componentTheme.dimens.height,
                  decoration: BoxDecoration(
                    color: componentTheme.colors.background,
                    borderRadius: componentTheme.dimens.borderRadius,
                    border: Border.all(color: componentTheme.colors.border),
                  ),
                  alignment: AlignmentDirectional.centerStart,
                ),
                TweenAnimationBuilder<double>(
                  duration: componentTheme.durations.progress,
                  curve: Curves.easeInOut,
                  tween: Tween(begin: 0, end: value),
                  builder: (context, animatedValue, child) =>
                      FractionallySizedBox(
                    widthFactor: animatedValue,
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: componentTheme.colors.foreground,
                        borderRadius: componentTheme.dimens.borderRadius,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (showText) ...[
            const SizedBox(height: 4),
            Text(
              '${(value * 100).toStringAsFixed(0)}%',
              style: componentTheme.textStyles.text,
            ),
          ],
        ],
      ),
    );
  }
}
