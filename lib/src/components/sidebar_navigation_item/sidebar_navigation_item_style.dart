import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiSidebarNavigationItemTheme
    extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSidebarNavigationItemAssetsTheme assets;
  final ImpaktfullUiSidebarNavigationItemColorTheme colors;
  final ImpaktfullUiSidebarNavigationItemDimensTheme dimens;
  final ImpaktfullUiSidebarNavigationItemDurationsTheme durations;
  final ImpaktfullUiSidebarNavigationItemTextStyleTheme textStyles;

  const ImpaktfullUiSidebarNavigationItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

  ImpaktfullUiSidebarNavigationItemTheme copyWith({
    ImpaktfullUiSidebarNavigationItemAssetsTheme? assets,
    ImpaktfullUiSidebarNavigationItemColorTheme? colors,
    ImpaktfullUiSidebarNavigationItemDimensTheme? dimens,
    ImpaktfullUiSidebarNavigationItemDurationsTheme? durations,
    ImpaktfullUiSidebarNavigationItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSidebarNavigationItemTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiSidebarNavigationItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.sidebarNavigationItem;

  static ImpaktfullUiSidebarNavigationItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSidebarNavigationItemTheme(
        assets: ImpaktfullUiSidebarNavigationItemAssetsTheme(
          chevronDown: assets.icons.chevronDown,
        ),
        colors: ImpaktfullUiSidebarNavigationItemColorTheme(
          background: colors.canvas,
          icons: colors.text,
        ),
        dimens: ImpaktfullUiSidebarNavigationItemDimensTheme(
          borderRadius: dimens.borderRadius,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          paddingWithSubItems: const EdgeInsetsDirectional.only(
            start: 16,
            end: 4,
          ),
        ),
        durations: ImpaktfullUiSidebarNavigationItemDurationsTheme(
          dropdownRotation: durations.short,
        ),
        textStyles: ImpaktfullUiSidebarNavigationItemTextStyleTheme(
          title: textStyles.onCard.text.medium.medium,
        ),
      );
}

class ImpaktfullUiSidebarNavigationItemAssetsTheme {
  final ImpaktfullUiAsset chevronDown;
  const ImpaktfullUiSidebarNavigationItemAssetsTheme({
    required this.chevronDown,
  });

  ImpaktfullUiSidebarNavigationItemAssetsTheme copyWith({
    ImpaktfullUiAsset? chevronDown,
  }) =>
      ImpaktfullUiSidebarNavigationItemAssetsTheme(
        chevronDown: chevronDown ?? this.chevronDown,
      );
}

class ImpaktfullUiSidebarNavigationItemColorTheme {
  final Color background;
  final Color icons;

  const ImpaktfullUiSidebarNavigationItemColorTheme({
    required this.background,
    required this.icons,
  });

  ImpaktfullUiSidebarNavigationItemColorTheme copyWith({
    Color? background,
    Color? icons,
  }) =>
      ImpaktfullUiSidebarNavigationItemColorTheme(
        background: background ?? this.background,
        icons: icons ?? this.icons,
      );
}

class ImpaktfullUiSidebarNavigationItemDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry paddingWithSubItems;

  const ImpaktfullUiSidebarNavigationItemDimensTheme({
    required this.borderRadius,
    required this.padding,
    required this.paddingWithSubItems,
  });

  ImpaktfullUiSidebarNavigationItemDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? paddingWithSubItems,
  }) =>
      ImpaktfullUiSidebarNavigationItemDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        padding: padding ?? this.padding,
        paddingWithSubItems: paddingWithSubItems ?? this.paddingWithSubItems,
      );
}

class ImpaktfullUiSidebarNavigationItemTextStyleTheme {
  final TextStyle title;

  const ImpaktfullUiSidebarNavigationItemTextStyleTheme({
    required this.title,
  });

  ImpaktfullUiSidebarNavigationItemTextStyleTheme copyWith({
    TextStyle? title,
  }) =>
      ImpaktfullUiSidebarNavigationItemTextStyleTheme(
        title: title ?? this.title,
      );
}

class ImpaktfullUiSidebarNavigationItemDurationsTheme {
  final Duration dropdownRotation;

  const ImpaktfullUiSidebarNavigationItemDurationsTheme({
    required this.dropdownRotation,
  });

  ImpaktfullUiSidebarNavigationItemDurationsTheme copyWith({
    Duration? dropdownRotation,
  }) =>
      ImpaktfullUiSidebarNavigationItemDurationsTheme(
        dropdownRotation: dropdownRotation ?? this.dropdownRotation,
      );
}
