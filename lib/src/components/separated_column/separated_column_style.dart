import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSeparatedColumnTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSeparatedColumnAssetsTheme assets;
  final ImpaktfullUiSeparatedColumnColorTheme colors;
  final ImpaktfullUiSeparatedColumnDimensTheme dimens;
  final ImpaktfullUiSeparatedColumnTextStyleTheme textStyles;

  const ImpaktfullUiSeparatedColumnTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiSeparatedColumnTheme copyWith({
    ImpaktfullUiSeparatedColumnAssetsTheme? assets,
    ImpaktfullUiSeparatedColumnColorTheme? colors,
    ImpaktfullUiSeparatedColumnDimensTheme? dimens,
    ImpaktfullUiSeparatedColumnTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSeparatedColumnTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiSeparatedColumnTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.separatedColumn;

  static ImpaktfullUiSeparatedColumnTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSeparatedColumnTheme(
        assets: const ImpaktfullUiSeparatedColumnAssetsTheme(),
        colors: ImpaktfullUiSeparatedColumnColorTheme(
          background: colors.card,
          border: colors.border,
        ),
        dimens: ImpaktfullUiSeparatedColumnDimensTheme(
          borderRadius: dimens.borderRadius,
          titleMargin: const EdgeInsetsDirectional.only(
            start: 16,
            end: 16,
            top: 16,
          ),
          separatorMargin: const EdgeInsets.symmetric(horizontal: 16),
        ),
        textStyles: const ImpaktfullUiSeparatedColumnTextStyleTheme(),
      );
}

class ImpaktfullUiSeparatedColumnAssetsTheme {
  const ImpaktfullUiSeparatedColumnAssetsTheme();

  ImpaktfullUiSeparatedColumnAssetsTheme copyWith() =>
      const ImpaktfullUiSeparatedColumnAssetsTheme();
}

class ImpaktfullUiSeparatedColumnColorTheme {
  final Color background;
  final Color? border;
  const ImpaktfullUiSeparatedColumnColorTheme({
    required this.background,
    required this.border,
  });

  ImpaktfullUiSeparatedColumnColorTheme copyWith({
    Color? background,
    Color? border,
  }) =>
      ImpaktfullUiSeparatedColumnColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
      );
}

class ImpaktfullUiSeparatedColumnDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry titleMargin;
  final EdgeInsetsGeometry separatorMargin;
  const ImpaktfullUiSeparatedColumnDimensTheme({
    required this.borderRadius,
    required this.titleMargin,
    required this.separatorMargin,
  });

  ImpaktfullUiSeparatedColumnDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? separatorMargin,
    EdgeInsetsGeometry? titleMargin,
  }) =>
      ImpaktfullUiSeparatedColumnDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        separatorMargin: separatorMargin ?? this.separatorMargin,
        titleMargin: titleMargin ?? this.titleMargin,
      );
}

class ImpaktfullUiSeparatedColumnTextStyleTheme {
  const ImpaktfullUiSeparatedColumnTextStyleTheme();

  ImpaktfullUiSeparatedColumnTextStyleTheme copyWith() =>
      const ImpaktfullUiSeparatedColumnTextStyleTheme();
}
