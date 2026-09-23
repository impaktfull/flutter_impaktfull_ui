import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiPlaceholderTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiPlaceholderAssetsTheme assets;
  final ImpaktfullUiPlaceholderColorTheme colors;
  final ImpaktfullUiPlaceholderDimensTheme dimens;
  final ImpaktfullUiPlaceholderTextStyleTheme textStyles;

  const ImpaktfullUiPlaceholderTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiPlaceholderTheme copyWith({
    ImpaktfullUiPlaceholderAssetsTheme? assets,
    ImpaktfullUiPlaceholderColorTheme? colors,
    ImpaktfullUiPlaceholderDimensTheme? dimens,
    ImpaktfullUiPlaceholderTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiPlaceholderTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiPlaceholderTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.placeholder;

  static ImpaktfullUiPlaceholderTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
  }) =>
      ImpaktfullUiPlaceholderTheme(
        assets: const ImpaktfullUiPlaceholderAssetsTheme(),
        colors: const ImpaktfullUiPlaceholderColorTheme(),
        dimens: const ImpaktfullUiPlaceholderDimensTheme(
          margin: EdgeInsets.zero,
          assetWidth: 150,
          assetHeight: 150,
        ),
        textStyles: ImpaktfullUiPlaceholderTextStyleTheme(
          title: textStyles.onCanvas.display.small.semiBold,
          subtitle: textStyles.onCanvas.text.small.light,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPlaceholderTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiPlaceholderAssetsTheme {
  final ImpaktfullUiAsset? asset;
  const ImpaktfullUiPlaceholderAssetsTheme({
    this.asset,
  });

  ImpaktfullUiPlaceholderAssetsTheme copyWith({
    ImpaktfullUiAsset? asset,
  }) =>
      ImpaktfullUiPlaceholderAssetsTheme(
        asset: asset ?? this.asset,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPlaceholderAssetsTheme && asset == other.asset;

  @override
  int get hashCode => asset.hashCode;
}

class ImpaktfullUiPlaceholderColorTheme {
  const ImpaktfullUiPlaceholderColorTheme();

  ImpaktfullUiPlaceholderColorTheme copyWith() =>
      const ImpaktfullUiPlaceholderColorTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiPlaceholderColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiPlaceholderDimensTheme {
  final EdgeInsets margin;
  final double assetWidth;
  final double assetHeight;

  const ImpaktfullUiPlaceholderDimensTheme({
    required this.margin,
    required this.assetWidth,
    required this.assetHeight,
  });

  ImpaktfullUiPlaceholderDimensTheme copyWith({
    double? assetHeight,
    double? assetWidth,
    EdgeInsets? margin,
  }) =>
      ImpaktfullUiPlaceholderDimensTheme(
        assetHeight: assetHeight ?? this.assetHeight,
        assetWidth: assetWidth ?? this.assetWidth,
        margin: margin ?? this.margin,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPlaceholderDimensTheme &&
          margin == other.margin &&
          assetWidth == other.assetWidth &&
          assetHeight == other.assetHeight;

  @override
  int get hashCode => Object.hash(margin, assetWidth, assetHeight);
}

class ImpaktfullUiPlaceholderTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;
  const ImpaktfullUiPlaceholderTextStyleTheme({
    required this.title,
    required this.subtitle,
  });

  ImpaktfullUiPlaceholderTextStyleTheme copyWith({
    TextStyle? subtitle,
    TextStyle? title,
  }) =>
      ImpaktfullUiPlaceholderTextStyleTheme(
        subtitle: subtitle ?? this.subtitle,
        title: title ?? this.title,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPlaceholderTextStyleTheme &&
          title == other.title &&
          subtitle == other.subtitle;

  @override
  int get hashCode => Object.hash(title, subtitle);
}
