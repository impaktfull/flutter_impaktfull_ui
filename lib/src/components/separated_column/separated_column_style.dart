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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSeparatedColumnTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiSeparatedColumnAssetsTheme {
  const ImpaktfullUiSeparatedColumnAssetsTheme();

  ImpaktfullUiSeparatedColumnAssetsTheme copyWith() =>
      const ImpaktfullUiSeparatedColumnAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiSeparatedColumnAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSeparatedColumnColorTheme &&
          background == other.background &&
          border == other.border;

  @override
  int get hashCode => Object.hash(background, border);
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSeparatedColumnDimensTheme &&
          borderRadius == other.borderRadius &&
          titleMargin == other.titleMargin &&
          separatorMargin == other.separatorMargin;

  @override
  int get hashCode => Object.hash(borderRadius, titleMargin, separatorMargin);
}

class ImpaktfullUiSeparatedColumnTextStyleTheme {
  const ImpaktfullUiSeparatedColumnTextStyleTheme();

  ImpaktfullUiSeparatedColumnTextStyleTheme copyWith() =>
      const ImpaktfullUiSeparatedColumnTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiSeparatedColumnTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
