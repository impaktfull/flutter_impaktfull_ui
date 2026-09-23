import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSelectableListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSelectableListItemAssetsTheme assets;
  final ImpaktfullUiSelectableListItemColorTheme colors;
  final ImpaktfullUiSelectableListItemDimensTheme dimens;
  final ImpaktfullUiSelectableListItemDurationsTheme durations;
  final ImpaktfullUiSelectableListItemTextStyleTheme textStyles;

  const ImpaktfullUiSelectableListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

  static ImpaktfullUiSelectableListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.selectableListItem;

  static ImpaktfullUiSelectableListItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSelectableListItemTheme(
        assets: ImpaktfullUiSelectableListItemAssetsTheme(
          check: assets.icons.check,
        ),
        colors: ImpaktfullUiSelectableListItemColorTheme(
          icons: colors.primary,
          selected: colors.accent,
          unselected: Colors.transparent,
        ),
        dimens: const ImpaktfullUiSelectableListItemDimensTheme(),
        durations: ImpaktfullUiSelectableListItemDurationsTheme(
          color: durations.short,
        ),
        textStyles: const ImpaktfullUiSelectableListItemTextStyleTheme(),
      );

  ImpaktfullUiSelectableListItemTheme copyWith({
    ImpaktfullUiSelectableListItemAssetsTheme? assets,
    ImpaktfullUiSelectableListItemColorTheme? colors,
    ImpaktfullUiSelectableListItemDimensTheme? dimens,
    ImpaktfullUiSelectableListItemDurationsTheme? durations,
    ImpaktfullUiSelectableListItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSelectableListItemTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSelectableListItemTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          durations == other.durations &&
          textStyles == other.textStyles;

  @override
  int get hashCode =>
      Object.hash(assets, colors, dimens, durations, textStyles);
}

class ImpaktfullUiSelectableListItemAssetsTheme {
  final ImpaktfullUiAsset check;
  const ImpaktfullUiSelectableListItemAssetsTheme({
    required this.check,
  });

  ImpaktfullUiSelectableListItemAssetsTheme copyWith({
    ImpaktfullUiAsset? check,
  }) =>
      ImpaktfullUiSelectableListItemAssetsTheme(
        check: check ?? this.check,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSelectableListItemAssetsTheme &&
          check == other.check;

  @override
  int get hashCode => check.hashCode;
}

class ImpaktfullUiSelectableListItemColorTheme {
  final Color? icons;
  final Color selected;
  final Color unselected;
  const ImpaktfullUiSelectableListItemColorTheme({
    required this.icons,
    required this.selected,
    required this.unselected,
  });

  ImpaktfullUiSelectableListItemColorTheme copyWith({
    Color? icons,
    Color? selected,
    Color? unselected,
  }) =>
      ImpaktfullUiSelectableListItemColorTheme(
        icons: icons ?? this.icons,
        selected: selected ?? this.selected,
        unselected: unselected ?? this.unselected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSelectableListItemColorTheme &&
          icons == other.icons &&
          selected == other.selected &&
          unselected == other.unselected;

  @override
  int get hashCode => Object.hash(icons, selected, unselected);
}

class ImpaktfullUiSelectableListItemDimensTheme {
  final double? leadingHeight;
  final double? leadingWidth;
  final double? trailingHeight;
  final double? trailingWidth;

  const ImpaktfullUiSelectableListItemDimensTheme({
    this.leadingHeight,
    this.leadingWidth,
    this.trailingHeight,
    this.trailingWidth,
  });

  ImpaktfullUiSelectableListItemDimensTheme copyWith({
    double? leadingHeight,
    double? leadingWidth,
    double? trailingHeight,
    double? trailingWidth,
  }) =>
      ImpaktfullUiSelectableListItemDimensTheme(
        leadingHeight: leadingHeight ?? this.leadingHeight,
        leadingWidth: leadingWidth ?? this.leadingWidth,
        trailingHeight: trailingHeight ?? this.trailingHeight,
        trailingWidth: trailingWidth ?? this.trailingWidth,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSelectableListItemDimensTheme &&
          leadingHeight == other.leadingHeight &&
          leadingWidth == other.leadingWidth &&
          trailingHeight == other.trailingHeight &&
          trailingWidth == other.trailingWidth;

  @override
  int get hashCode =>
      Object.hash(leadingHeight, leadingWidth, trailingHeight, trailingWidth);
}

class ImpaktfullUiSelectableListItemDurationsTheme {
  final Duration color;
  const ImpaktfullUiSelectableListItemDurationsTheme({
    required this.color,
  });

  ImpaktfullUiSelectableListItemDurationsTheme copyWith({
    Duration? color,
  }) =>
      ImpaktfullUiSelectableListItemDurationsTheme(
        color: color ?? this.color,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSelectableListItemDurationsTheme &&
          color == other.color;

  @override
  int get hashCode => color.hashCode;
}

class ImpaktfullUiSelectableListItemTextStyleTheme {
  const ImpaktfullUiSelectableListItemTextStyleTheme();

  ImpaktfullUiSelectableListItemTextStyleTheme copyWith() =>
      const ImpaktfullUiSelectableListItemTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiSelectableListItemTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
