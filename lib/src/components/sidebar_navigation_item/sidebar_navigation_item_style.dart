import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiSidebarNavigationItemTheme
    extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSidebarNavigationItemAssetsTheme assets;
  final ImpaktfullUiSidebarNavigationItemColorTheme colors;
  final ImpaktfullUiSidebarNavigationItemDimensTheme dimens;
  final ImpaktfullUiSidebarNavigationItemDurationTheme durations;
  final ImpaktfullUiSidebarNavigationItemTextStyleTheme textStyles;

  const ImpaktfullUiSidebarNavigationItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

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
        durations: ImpaktfullUiSidebarNavigationItemDurationTheme(
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
}

class ImpaktfullUiSidebarNavigationItemColorTheme {
  final Color background;
  final Color icons;

  const ImpaktfullUiSidebarNavigationItemColorTheme({
    required this.background,
    required this.icons,
  });
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
}

class ImpaktfullUiSidebarNavigationItemTextStyleTheme {
  final TextStyle title;

  const ImpaktfullUiSidebarNavigationItemTextStyleTheme({
    required this.title,
  });
}

class ImpaktfullUiSidebarNavigationItemDurationTheme {
  final Duration dropdownRotation;

  const ImpaktfullUiSidebarNavigationItemDurationTheme({
    required this.dropdownRotation,
  });
}
