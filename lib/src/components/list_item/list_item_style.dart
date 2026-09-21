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
}

class ImpaktfullUiListItemTextStyleTheme {
  const ImpaktfullUiListItemTextStyleTheme();

  ImpaktfullUiListItemTextStyleTheme copyWith() =>
      const ImpaktfullUiListItemTextStyleTheme();
}
