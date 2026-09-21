import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiUnifiedScreenLayoutTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiUnifiedScreenLayoutAssetsTheme assets;
  final ImpaktfullUiUnifiedScreenLayoutColorTheme colors;
  final ImpaktfullUiUnifiedScreenLayoutDimensTheme dimens;
  final ImpaktfullUiUnifiedScreenLayoutTextStyleTheme textStyles;

  const ImpaktfullUiUnifiedScreenLayoutTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiUnifiedScreenLayoutTheme copyWith({
    ImpaktfullUiUnifiedScreenLayoutAssetsTheme? assets,
    ImpaktfullUiUnifiedScreenLayoutColorTheme? colors,
    ImpaktfullUiUnifiedScreenLayoutDimensTheme? dimens,
    ImpaktfullUiUnifiedScreenLayoutTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiUnifiedScreenLayoutTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiUnifiedScreenLayoutTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.unifiedScreenLayout;

  static ImpaktfullUiUnifiedScreenLayoutTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUiUnifiedScreenLayoutTheme(
        assets: ImpaktfullUiUnifiedScreenLayoutAssetsTheme(),
        colors: ImpaktfullUiUnifiedScreenLayoutColorTheme(),
        dimens: ImpaktfullUiUnifiedScreenLayoutDimensTheme(
          centerWidthFactor: 0.5,
          centerMinWidth: 500,
          centerMaxWidth: 700,
          centerPadding: EdgeInsets.all(16),
        ),
        textStyles: ImpaktfullUiUnifiedScreenLayoutTextStyleTheme(),
      );
}

class ImpaktfullUiUnifiedScreenLayoutAssetsTheme {
  const ImpaktfullUiUnifiedScreenLayoutAssetsTheme();

  ImpaktfullUiUnifiedScreenLayoutAssetsTheme copyWith() =>
      const ImpaktfullUiUnifiedScreenLayoutAssetsTheme();
}

class ImpaktfullUiUnifiedScreenLayoutColorTheme {
  const ImpaktfullUiUnifiedScreenLayoutColorTheme();

  ImpaktfullUiUnifiedScreenLayoutColorTheme copyWith() =>
      const ImpaktfullUiUnifiedScreenLayoutColorTheme();
}

class ImpaktfullUiUnifiedScreenLayoutDimensTheme {
  final double centerWidthFactor;
  final double centerMinWidth;
  final double centerMaxWidth;
  final EdgeInsetsGeometry centerPadding;

  const ImpaktfullUiUnifiedScreenLayoutDimensTheme({
    required this.centerWidthFactor,
    required this.centerMinWidth,
    required this.centerMaxWidth,
    required this.centerPadding,
  });

  ImpaktfullUiUnifiedScreenLayoutDimensTheme copyWith({
    double? centerMaxWidth,
    double? centerMinWidth,
    EdgeInsetsGeometry? centerPadding,
    double? centerWidthFactor,
  }) =>
      ImpaktfullUiUnifiedScreenLayoutDimensTheme(
        centerMaxWidth: centerMaxWidth ?? this.centerMaxWidth,
        centerMinWidth: centerMinWidth ?? this.centerMinWidth,
        centerPadding: centerPadding ?? this.centerPadding,
        centerWidthFactor: centerWidthFactor ?? this.centerWidthFactor,
      );
}

class ImpaktfullUiUnifiedScreenLayoutTextStyleTheme {
  const ImpaktfullUiUnifiedScreenLayoutTextStyleTheme();

  ImpaktfullUiUnifiedScreenLayoutTextStyleTheme copyWith() =>
      const ImpaktfullUiUnifiedScreenLayoutTextStyleTheme();
}
