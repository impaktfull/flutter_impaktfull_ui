import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/loading_indicator/loading_indicator_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:lottie/lottie.dart';

export 'loading_indicator_style.dart';

class ImpaktfullUiLoadingIndicator extends StatelessWidget {
  final String? asset;
  final ImpaktfullUiLoadingIndicatorTheme? theme;

  const ImpaktfullUiLoadingIndicator({
    this.theme,
    super.key,
  }) : asset = null;

  const ImpaktfullUiLoadingIndicator.custom({
    required this.asset,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiLoadingIndicatorTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) {
        final lottie = asset ?? componentTheme.assets.lottie;
        if (lottie != null) {
          return Lottie.asset(
            lottie,
            width: 48,
            height: 48,
          );
        }
        return CircularProgressIndicator(
          color: componentTheme.colors.color,
        );
      },
    );
  }
}
