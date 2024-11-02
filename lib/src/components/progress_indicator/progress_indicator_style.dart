import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiProgressIndicatorTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiProgressIndicatorAssetsTheme assets;
  final ImpaktfullUiProgressIndicatorColorTheme colors;
  final ImpaktfullUiProgressIndicatorDimensTheme dimens;
  final ImpaktfullUiProgressIndicatorDurationsTheme durations;
  final ImpaktfullUiProgressIndicatorTextStyleTheme textStyles;

  const ImpaktfullUiProgressIndicatorTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

  static ImpaktfullUiProgressIndicatorTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.progressIndicator;
}

class ImpaktfullUiProgressIndicatorAssetsTheme {
  const ImpaktfullUiProgressIndicatorAssetsTheme();
}

class ImpaktfullUiProgressIndicatorColorTheme {
  final Color background;
  final Color border;
  final Color foreground;
  const ImpaktfullUiProgressIndicatorColorTheme({
    required this.background,
    required this.foreground,
    required this.border,
  });
}

class ImpaktfullUiProgressIndicatorDimensTheme {
  final double height;
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiProgressIndicatorDimensTheme({
    required this.height,
    required this.borderRadius,
  });
}

class ImpaktfullUiProgressIndicatorDurationsTheme {
  final Duration progress;
  const ImpaktfullUiProgressIndicatorDurationsTheme({
    required this.progress,
  });
}

class ImpaktfullUiProgressIndicatorTextStyleTheme {
  final TextStyle text;
  const ImpaktfullUiProgressIndicatorTextStyleTheme({
    required this.text,
  });
}
