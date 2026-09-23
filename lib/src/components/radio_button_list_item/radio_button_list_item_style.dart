import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiRadioButtonListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiRadioButtonListItemAssetsTheme assets;
  final ImpaktfullUiRadioButtonListItemColorTheme colors;
  final ImpaktfullUiRadioButtonListItemDimensTheme dimens;
  final ImpaktfullUiRadioButtonListItemTextStyleTheme textStyles;

  const ImpaktfullUiRadioButtonListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiRadioButtonListItemTheme copyWith({
    ImpaktfullUiRadioButtonListItemAssetsTheme? assets,
    ImpaktfullUiRadioButtonListItemColorTheme? colors,
    ImpaktfullUiRadioButtonListItemDimensTheme? dimens,
    ImpaktfullUiRadioButtonListItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiRadioButtonListItemTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiRadioButtonListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.radioButtonListItem;

  static ImpaktfullUiRadioButtonListItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiRadioButtonListItemTheme(
        assets: const ImpaktfullUiRadioButtonListItemAssetsTheme(),
        colors: ImpaktfullUiRadioButtonListItemColorTheme(
          icons: colors.primary,
        ),
        dimens: ImpaktfullUiRadioButtonListItemDimensTheme(
          borderRadius: dimens.borderRadiusCircle,
        ),
        textStyles: const ImpaktfullUiRadioButtonListItemTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiRadioButtonListItemTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiRadioButtonListItemAssetsTheme {
  const ImpaktfullUiRadioButtonListItemAssetsTheme();

  ImpaktfullUiRadioButtonListItemAssetsTheme copyWith() =>
      const ImpaktfullUiRadioButtonListItemAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiRadioButtonListItemAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiRadioButtonListItemColorTheme {
  final Color icons;
  const ImpaktfullUiRadioButtonListItemColorTheme({
    required this.icons,
  });

  ImpaktfullUiRadioButtonListItemColorTheme copyWith({
    Color? icons,
  }) =>
      ImpaktfullUiRadioButtonListItemColorTheme(
        icons: icons ?? this.icons,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiRadioButtonListItemColorTheme &&
          icons == other.icons;

  @override
  int get hashCode => icons.hashCode;
}

class ImpaktfullUiRadioButtonListItemDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiRadioButtonListItemDimensTheme({
    required this.borderRadius,
  });

  ImpaktfullUiRadioButtonListItemDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
  }) =>
      ImpaktfullUiRadioButtonListItemDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiRadioButtonListItemDimensTheme &&
          borderRadius == other.borderRadius;

  @override
  int get hashCode => borderRadius.hashCode;
}

class ImpaktfullUiRadioButtonListItemTextStyleTheme {
  const ImpaktfullUiRadioButtonListItemTextStyleTheme();

  ImpaktfullUiRadioButtonListItemTextStyleTheme copyWith() =>
      const ImpaktfullUiRadioButtonListItemTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiRadioButtonListItemTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
