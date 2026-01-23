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

  static ImpaktfullUiTabBarItemTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.tabBarItem;

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
}

class ImpaktfullUiTabBarItemAssetsTheme {
  const ImpaktfullUiTabBarItemAssetsTheme();
}

class ImpaktfullUiTabBarItemColorTheme {
  final Color background;
  const ImpaktfullUiTabBarItemColorTheme({
    required this.background,
  });
}

class ImpaktfullUiTabBarItemDimensTheme {
  final BorderRadiusGeometry selectedMarkerBorderRadius;
  const ImpaktfullUiTabBarItemDimensTheme({
    required this.selectedMarkerBorderRadius,
  });
}

class ImpaktfullUiTabBarItemDurationsTheme {
  final Duration selected;
  const ImpaktfullUiTabBarItemDurationsTheme({
    required this.selected,
  });
}

class ImpaktfullUiTabBarItemTextStyleTheme {
  final TextStyle label;
  const ImpaktfullUiTabBarItemTextStyleTheme({
    required this.label,
  });
}
