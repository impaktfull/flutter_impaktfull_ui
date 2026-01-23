import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiHorizontalTabsTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiHorizontalTabsColorTheme colors;
  final ImpaktfullUiHorizontalTabsDimensTheme dimens;

  const ImpaktfullUiHorizontalTabsTheme({
    required this.colors,
    required this.dimens,
  });

  static ImpaktfullUiHorizontalTabsTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.horizontalTabs;

  static ImpaktfullUiHorizontalTabsTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUiHorizontalTabsTheme(
        colors: ImpaktfullUiHorizontalTabsColorTheme(),
        dimens: ImpaktfullUiHorizontalTabsDimensTheme(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      );
}

class ImpaktfullUiHorizontalTabsColorTheme {
  const ImpaktfullUiHorizontalTabsColorTheme();
}

class ImpaktfullUiHorizontalTabsDimensTheme {
  final EdgeInsets padding;
  const ImpaktfullUiHorizontalTabsDimensTheme({
    required this.padding,
  });
}
