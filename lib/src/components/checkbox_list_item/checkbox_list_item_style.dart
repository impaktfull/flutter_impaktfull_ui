import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiCheckboxListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCheckboxListItemAssetsTheme assets;
  final ImpaktfullUiCheckboxListItemColorTheme colors;
  final ImpaktfullUiCheckboxListItemDimensTheme dimens;
  final ImpaktfullUiCheckboxListItemTextStyleTheme textStyles;

  const ImpaktfullUiCheckboxListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiCheckboxListItemTheme copyWith({
    ImpaktfullUiCheckboxListItemAssetsTheme? assets,
    ImpaktfullUiCheckboxListItemColorTheme? colors,
    ImpaktfullUiCheckboxListItemDimensTheme? dimens,
    ImpaktfullUiCheckboxListItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiCheckboxListItemTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiCheckboxListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.checkboxListItem;

  static ImpaktfullUiCheckboxListItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiCheckboxListItemTheme(
        assets: const ImpaktfullUiCheckboxListItemAssetsTheme(),
        colors: ImpaktfullUiCheckboxListItemColorTheme(
          icons: colors.primary,
        ),
        dimens: const ImpaktfullUiCheckboxListItemDimensTheme(),
        textStyles: const ImpaktfullUiCheckboxListItemTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCheckboxListItemTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiCheckboxListItemAssetsTheme {
  const ImpaktfullUiCheckboxListItemAssetsTheme();

  ImpaktfullUiCheckboxListItemAssetsTheme copyWith() =>
      const ImpaktfullUiCheckboxListItemAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiCheckboxListItemAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiCheckboxListItemColorTheme {
  final Color icons;
  const ImpaktfullUiCheckboxListItemColorTheme({
    required this.icons,
  });

  ImpaktfullUiCheckboxListItemColorTheme copyWith({
    Color? icons,
  }) =>
      ImpaktfullUiCheckboxListItemColorTheme(
        icons: icons ?? this.icons,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCheckboxListItemColorTheme && icons == other.icons;

  @override
  int get hashCode => icons.hashCode;
}

class ImpaktfullUiCheckboxListItemDimensTheme {
  const ImpaktfullUiCheckboxListItemDimensTheme();

  ImpaktfullUiCheckboxListItemDimensTheme copyWith() =>
      const ImpaktfullUiCheckboxListItemDimensTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiCheckboxListItemDimensTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiCheckboxListItemTextStyleTheme {
  const ImpaktfullUiCheckboxListItemTextStyleTheme();

  ImpaktfullUiCheckboxListItemTextStyleTheme copyWith() =>
      const ImpaktfullUiCheckboxListItemTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiCheckboxListItemTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
