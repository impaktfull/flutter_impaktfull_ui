import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiTabBarItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTabBarItemAssetsTheme assets;
  final ImpaktfullUiTabBarItemColorTheme colors;
  final ImpaktfullUiTabBarItemDimensTheme dimens;
  final ImpaktfullUiTabBarItemDurationsTheme durations;
  final ImpaktfullUiTabBarItemTextStyleTheme textStyles;

  const ImpaktfullUiTabBarItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

  ImpaktfullUiTabBarItemTheme copyWith({
    ImpaktfullUiTabBarItemAssetsTheme? assets,
    ImpaktfullUiTabBarItemColorTheme? colors,
    ImpaktfullUiTabBarItemDimensTheme? dimens,
    ImpaktfullUiTabBarItemDurationsTheme? durations,
    ImpaktfullUiTabBarItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiTabBarItemTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiTabBarItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tabBarItem;

  static ImpaktfullUiTabBarItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiTabBarItemTheme(
        assets: const ImpaktfullUiTabBarItemAssetsTheme(),
        colors: ImpaktfullUiTabBarItemColorTheme(
          background: colors.card,
        ),
        dimens: ImpaktfullUiTabBarItemDimensTheme(
          selectedMarkerBorderRadius: dimens.borderRadius,
        ),
        durations: ImpaktfullUiTabBarItemDurationsTheme(
          selected: durations.short,
        ),
        textStyles: ImpaktfullUiTabBarItemTextStyleTheme(
          label: textStyles.onCard.text.small.medium,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTabBarItemTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          durations == other.durations &&
          textStyles == other.textStyles;

  @override
  int get hashCode =>
      Object.hash(assets, colors, dimens, durations, textStyles);
}

class ImpaktfullUiTabBarItemAssetsTheme {
  const ImpaktfullUiTabBarItemAssetsTheme();

  ImpaktfullUiTabBarItemAssetsTheme copyWith() =>
      const ImpaktfullUiTabBarItemAssetsTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiTabBarItemAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiTabBarItemColorTheme {
  final Color background;
  const ImpaktfullUiTabBarItemColorTheme({
    required this.background,
  });

  ImpaktfullUiTabBarItemColorTheme copyWith({
    Color? background,
  }) =>
      ImpaktfullUiTabBarItemColorTheme(
        background: background ?? this.background,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTabBarItemColorTheme &&
          background == other.background;

  @override
  int get hashCode => background.hashCode;
}

class ImpaktfullUiTabBarItemDimensTheme {
  final BorderRadiusGeometry selectedMarkerBorderRadius;
  const ImpaktfullUiTabBarItemDimensTheme({
    required this.selectedMarkerBorderRadius,
  });

  ImpaktfullUiTabBarItemDimensTheme copyWith({
    BorderRadiusGeometry? selectedMarkerBorderRadius,
  }) =>
      ImpaktfullUiTabBarItemDimensTheme(
        selectedMarkerBorderRadius:
            selectedMarkerBorderRadius ?? this.selectedMarkerBorderRadius,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTabBarItemDimensTheme &&
          selectedMarkerBorderRadius == other.selectedMarkerBorderRadius;

  @override
  int get hashCode => selectedMarkerBorderRadius.hashCode;
}

class ImpaktfullUiTabBarItemDurationsTheme {
  final Duration selected;
  const ImpaktfullUiTabBarItemDurationsTheme({
    required this.selected,
  });

  ImpaktfullUiTabBarItemDurationsTheme copyWith({
    Duration? selected,
  }) =>
      ImpaktfullUiTabBarItemDurationsTheme(
        selected: selected ?? this.selected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTabBarItemDurationsTheme &&
          selected == other.selected;

  @override
  int get hashCode => selected.hashCode;
}

class ImpaktfullUiTabBarItemTextStyleTheme {
  final TextStyle label;
  const ImpaktfullUiTabBarItemTextStyleTheme({
    required this.label,
  });

  ImpaktfullUiTabBarItemTextStyleTheme copyWith({
    TextStyle? label,
  }) =>
      ImpaktfullUiTabBarItemTextStyleTheme(
        label: label ?? this.label,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTabBarItemTextStyleTheme && label == other.label;

  @override
  int get hashCode => label.hashCode;
}
