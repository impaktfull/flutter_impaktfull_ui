import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiNetworkImageTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiNetworkImageAssetsTheme assets;
  final ImpaktfullUiNetworkImageColorTheme colors;
  final ImpaktfullUiNetworkImageDimensTheme dimens;
  final ImpaktfullUiNetworkImageTextStyleTheme textStyles;

  const ImpaktfullUiNetworkImageTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiNetworkImageTheme copyWith({
    ImpaktfullUiNetworkImageAssetsTheme? assets,
    ImpaktfullUiNetworkImageColorTheme? colors,
    ImpaktfullUiNetworkImageDimensTheme? dimens,
    ImpaktfullUiNetworkImageTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiNetworkImageTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiNetworkImageTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.networkImage;

  static ImpaktfullUiNetworkImageTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUiNetworkImageTheme(
        assets: ImpaktfullUiNetworkImageAssetsTheme(),
        colors: ImpaktfullUiNetworkImageColorTheme(),
        dimens: ImpaktfullUiNetworkImageDimensTheme(),
        textStyles: ImpaktfullUiNetworkImageTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNetworkImageTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiNetworkImageAssetsTheme {
  const ImpaktfullUiNetworkImageAssetsTheme();

  ImpaktfullUiNetworkImageAssetsTheme copyWith() =>
      const ImpaktfullUiNetworkImageAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiNetworkImageAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiNetworkImageColorTheme {
  const ImpaktfullUiNetworkImageColorTheme();

  ImpaktfullUiNetworkImageColorTheme copyWith() =>
      const ImpaktfullUiNetworkImageColorTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiNetworkImageColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiNetworkImageDimensTheme {
  const ImpaktfullUiNetworkImageDimensTheme();

  ImpaktfullUiNetworkImageDimensTheme copyWith() =>
      const ImpaktfullUiNetworkImageDimensTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiNetworkImageDimensTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiNetworkImageTextStyleTheme {
  const ImpaktfullUiNetworkImageTextStyleTheme();

  ImpaktfullUiNetworkImageTextStyleTheme copyWith() =>
      const ImpaktfullUiNetworkImageTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiNetworkImageTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
