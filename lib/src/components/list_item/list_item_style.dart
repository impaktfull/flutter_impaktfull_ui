import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiListItemAssetsTheme assets;
  final ImpaktfullUiListItemColorTheme colors;
  final ImpaktfullUiListItemDimensTheme dimens;
  final ImpaktfullUiListItemTextStyleTheme textStyles;

  const ImpaktfullUiListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiListItemTheme copyWith({
    ImpaktfullUiListItemAssetsTheme? assets,
    ImpaktfullUiListItemColorTheme? colors,
    ImpaktfullUiListItemDimensTheme? dimens,
    ImpaktfullUiListItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiListItemTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.listItem;

  static ImpaktfullUiListItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiListItemTheme(
        assets: ImpaktfullUiListItemAssetsTheme(
          chevronRight: assets.icons.chevronRight,
        ),
        colors: ImpaktfullUiListItemColorTheme(
          icons: colors.primary,
          danger: colors.destructive,
        ),
        dimens: const ImpaktfullUiListItemDimensTheme(),
        textStyles: const ImpaktfullUiListItemTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiListItemTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiListItemAssetsTheme {
  final ImpaktfullUiAsset chevronRight;

  const ImpaktfullUiListItemAssetsTheme({
    required this.chevronRight,
  });

  ImpaktfullUiListItemAssetsTheme copyWith({
    ImpaktfullUiAsset? chevronRight,
  }) =>
      ImpaktfullUiListItemAssetsTheme(
        chevronRight: chevronRight ?? this.chevronRight,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiListItemAssetsTheme &&
          chevronRight == other.chevronRight;

  @override
  int get hashCode => chevronRight.hashCode;
}

class ImpaktfullUiListItemColorTheme {
  final Color icons;
  final Color danger;
  const ImpaktfullUiListItemColorTheme({
    required this.icons,
    required this.danger,
  });

  ImpaktfullUiListItemColorTheme copyWith({
    Color? danger,
    Color? icons,
  }) =>
      ImpaktfullUiListItemColorTheme(
        danger: danger ?? this.danger,
        icons: icons ?? this.icons,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiListItemColorTheme &&
          icons == other.icons &&
          danger == other.danger;

  @override
  int get hashCode => Object.hash(icons, danger);
}

class ImpaktfullUiListItemDimensTheme {
  final double? leadingSize;
  const ImpaktfullUiListItemDimensTheme({
    this.leadingSize,
  });

  ImpaktfullUiListItemDimensTheme copyWith({
    double? leadingSize,
  }) =>
      ImpaktfullUiListItemDimensTheme(
        leadingSize: leadingSize ?? this.leadingSize,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiListItemDimensTheme &&
          leadingSize == other.leadingSize;

  @override
  int get hashCode => leadingSize.hashCode;
}

class ImpaktfullUiListItemTextStyleTheme {
  const ImpaktfullUiListItemTextStyleTheme();

  ImpaktfullUiListItemTextStyleTheme copyWith() =>
      const ImpaktfullUiListItemTextStyleTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiListItemTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
