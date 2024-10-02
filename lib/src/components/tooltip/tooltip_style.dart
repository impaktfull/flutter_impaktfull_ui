import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiTooltipTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTooltipColorTheme colors;
  final ImpaktfullUiTooltipTextStyleTheme textStyles;
  final ImpaktfullUiTooltipDimensTheme dimens;
  final ImpaktfullUiTooltipDurationTheme durations;
  final ImpaktfullUiTooltipAssetsTheme assets;

  const ImpaktfullUiTooltipTheme({
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.durations,
    required this.assets,
  });

  static ImpaktfullUiTooltipTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tooltip;
}

class ImpaktfullUiTooltipColorTheme {
  final Color background;

  const ImpaktfullUiTooltipColorTheme({
    required this.background,
  });
}

class ImpaktfullUiTooltipTextStyleTheme {
  const ImpaktfullUiTooltipTextStyleTheme();
}

class ImpaktfullUiTooltipDimensTheme {
  final BorderRadius borderRadius;

  const ImpaktfullUiTooltipDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiTooltipDurationTheme {
  final Duration wait;

  const ImpaktfullUiTooltipDurationTheme({
    required this.wait,
  });
}

class ImpaktfullUiTooltipAssetsTheme {
  const ImpaktfullUiTooltipAssetsTheme();
}
