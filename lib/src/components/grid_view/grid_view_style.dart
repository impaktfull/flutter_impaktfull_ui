import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiGridViewTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiGridViewAssetsTheme assets;
  final ImpaktfullUiGridViewColorTheme colors;
  final ImpaktfullUiGridViewDimensTheme dimens;
  final ImpaktfullUiGridViewTextStyleTheme textStyles;

  const ImpaktfullUiGridViewTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiGridViewTheme copyWith({
    ImpaktfullUiGridViewAssetsTheme? assets,
    ImpaktfullUiGridViewColorTheme? colors,
    ImpaktfullUiGridViewDimensTheme? dimens,
    ImpaktfullUiGridViewTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiGridViewTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiGridViewTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.gridView;

  static ImpaktfullUiGridViewTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiGridViewTheme(
        assets: const ImpaktfullUiGridViewAssetsTheme(),
        colors: const ImpaktfullUiGridViewColorTheme(),
        dimens: const ImpaktfullUiGridViewDimensTheme(),
        textStyles: ImpaktfullUiGridViewTextStyleTheme(
          title: textStyles.onCanvas.display.small,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiGridViewTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiGridViewAssetsTheme {
  const ImpaktfullUiGridViewAssetsTheme();

  ImpaktfullUiGridViewAssetsTheme copyWith() =>
      const ImpaktfullUiGridViewAssetsTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiGridViewAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiGridViewColorTheme {
  const ImpaktfullUiGridViewColorTheme();

  ImpaktfullUiGridViewColorTheme copyWith() =>
      const ImpaktfullUiGridViewColorTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiGridViewColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiGridViewDimensTheme {
  /// The size of the image of an item.
  final double imageSize;

  const ImpaktfullUiGridViewDimensTheme({
    this.imageSize = 50,
  });

  ImpaktfullUiGridViewDimensTheme copyWith({
    double? imageSize,
  }) =>
      ImpaktfullUiGridViewDimensTheme(
        imageSize: imageSize ?? this.imageSize,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiGridViewDimensTheme && imageSize == other.imageSize;

  @override
  int get hashCode => imageSize.hashCode;
}

class ImpaktfullUiGridViewTextStyleTheme {
  final TextStyle title;
  const ImpaktfullUiGridViewTextStyleTheme({
    required this.title,
  });

  ImpaktfullUiGridViewTextStyleTheme copyWith({
    TextStyle? title,
  }) =>
      ImpaktfullUiGridViewTextStyleTheme(
        title: title ?? this.title,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiGridViewTextStyleTheme && title == other.title;

  @override
  int get hashCode => title.hashCode;
}
