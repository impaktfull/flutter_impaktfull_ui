import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiPaginationTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiPaginationAssetsTheme assets;
  final ImpaktfullUiPaginationColorTheme colors;
  final ImpaktfullUiPaginationDimensTheme dimens;
  final ImpaktfullUiPaginationTextStyleTheme textStyles;

  const ImpaktfullUiPaginationTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiPaginationTheme copyWith({
    ImpaktfullUiPaginationAssetsTheme? assets,
    ImpaktfullUiPaginationColorTheme? colors,
    ImpaktfullUiPaginationDimensTheme? dimens,
    ImpaktfullUiPaginationTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiPaginationTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiPaginationTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.pagination;

  static ImpaktfullUiPaginationTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiPaginationTheme(
        assets: ImpaktfullUiPaginationAssetsTheme(
          arrowLeft: assets.icons.arrowLeft,
          arrowRight: assets.icons.arrowRight,
        ),
        colors: const ImpaktfullUiPaginationColorTheme(),
        dimens: const ImpaktfullUiPaginationDimensTheme(),
        textStyles: ImpaktfullUiPaginationTextStyleTheme(
          text: textStyles.onCard.text.small,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPaginationTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiPaginationAssetsTheme {
  final ImpaktfullUiAsset arrowLeft;
  final ImpaktfullUiAsset arrowRight;
  const ImpaktfullUiPaginationAssetsTheme({
    required this.arrowLeft,
    required this.arrowRight,
  });

  ImpaktfullUiPaginationAssetsTheme copyWith({
    ImpaktfullUiAsset? arrowLeft,
    ImpaktfullUiAsset? arrowRight,
  }) =>
      ImpaktfullUiPaginationAssetsTheme(
        arrowLeft: arrowLeft ?? this.arrowLeft,
        arrowRight: arrowRight ?? this.arrowRight,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPaginationAssetsTheme &&
          arrowLeft == other.arrowLeft &&
          arrowRight == other.arrowRight;

  @override
  int get hashCode => Object.hash(arrowLeft, arrowRight);
}

class ImpaktfullUiPaginationColorTheme {
  const ImpaktfullUiPaginationColorTheme();

  ImpaktfullUiPaginationColorTheme copyWith() =>
      const ImpaktfullUiPaginationColorTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiPaginationColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiPaginationDimensTheme {
  const ImpaktfullUiPaginationDimensTheme();

  ImpaktfullUiPaginationDimensTheme copyWith() =>
      const ImpaktfullUiPaginationDimensTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiPaginationDimensTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiPaginationTextStyleTheme {
  final TextStyle text;

  const ImpaktfullUiPaginationTextStyleTheme({
    required this.text,
  });

  ImpaktfullUiPaginationTextStyleTheme copyWith({
    TextStyle? text,
  }) =>
      ImpaktfullUiPaginationTextStyleTheme(
        text: text ?? this.text,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPaginationTextStyleTheme && text == other.text;

  @override
  int get hashCode => text.hashCode;
}
