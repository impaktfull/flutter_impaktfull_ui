import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiRefreshIndicatorTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiRefreshIndicatorColorTheme colors;

  const ImpaktfullUiRefreshIndicatorTheme({
    required this.colors,
  });

  ImpaktfullUiRefreshIndicatorTheme copyWith({
    ImpaktfullUiRefreshIndicatorColorTheme? colors,
  }) =>
      ImpaktfullUiRefreshIndicatorTheme(
        colors: colors ?? this.colors,
      );

  static ImpaktfullUiRefreshIndicatorTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.refreshIndicator;

  static ImpaktfullUiRefreshIndicatorTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiRefreshIndicatorTheme(
        colors: ImpaktfullUiRefreshIndicatorColorTheme(
          loadingIndicator: colors.accent,
          backgroundColor: colors.canvas,
        ),
      );
}

class ImpaktfullUiRefreshIndicatorColorTheme {
  final Color loadingIndicator;
  final Color backgroundColor;

  const ImpaktfullUiRefreshIndicatorColorTheme({
    required this.loadingIndicator,
    required this.backgroundColor,
  });

  ImpaktfullUiRefreshIndicatorColorTheme copyWith({
    Color? backgroundColor,
    Color? loadingIndicator,
  }) =>
      ImpaktfullUiRefreshIndicatorColorTheme(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        loadingIndicator: loadingIndicator ?? this.loadingIndicator,
      );
}
