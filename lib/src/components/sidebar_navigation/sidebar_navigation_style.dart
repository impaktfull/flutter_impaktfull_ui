import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSidebarNavigationTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSidebarNavigationAssetsTheme assets;
  final ImpaktfullUiSidebarNavigationColorTheme colors;
  final ImpaktfullUiSidebarNavigationDimensTheme dimens;
  final ImpaktfullUiSidebarNavigationTextStyleTheme textStyles;

  const ImpaktfullUiSidebarNavigationTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiSidebarNavigationTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.sidebarNavigation;

  static ImpaktfullUiSidebarNavigationTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSidebarNavigationTheme(
        assets: const ImpaktfullUiSidebarNavigationAssetsTheme(),
        colors: ImpaktfullUiSidebarNavigationColorTheme(
          backgroundColor: colors.card,
          border: colors.border,
        ),
        dimens: const ImpaktfullUiSidebarNavigationDimensTheme(
          padding: EdgeInsetsDirectional.all(16),
        ),
        textStyles: const ImpaktfullUiSidebarNavigationTextStyleTheme(),
      );
}

class ImpaktfullUiSidebarNavigationAssetsTheme {
  const ImpaktfullUiSidebarNavigationAssetsTheme();
}

class ImpaktfullUiSidebarNavigationColorTheme {
  final Color backgroundColor;
  final Color border;

  const ImpaktfullUiSidebarNavigationColorTheme({
    required this.backgroundColor,
    required this.border,
  });
}

class ImpaktfullUiSidebarNavigationDimensTheme {
  final EdgeInsetsGeometry padding;

  const ImpaktfullUiSidebarNavigationDimensTheme({
    required this.padding,
  });
}

class ImpaktfullUiSidebarNavigationTextStyleTheme {
  const ImpaktfullUiSidebarNavigationTextStyleTheme();
}
