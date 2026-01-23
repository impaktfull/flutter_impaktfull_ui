import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiHorizontalTabTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiHorizontalTabColorTheme colors;
  final ImpaktfullUiHorizontalTabTextStylesTheme textStyles;
  final ImpaktfullUiHorizontalTabDimensTheme dimens;

  const ImpaktfullUiHorizontalTabTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiHorizontalTabTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.horizontalTab;

  static ImpaktfullUiHorizontalTabTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiHorizontalTabTheme(
        colors: ImpaktfullUiHorizontalTabColorTheme(
          backgroundUnSelectedTab: colors.card,
          backgroundSelectedTab: colors.accent.withOpacityPercentage(0.33),
        ),
        dimens: ImpaktfullUiHorizontalTabDimensTheme(
          borderRadius: dimens.borderRadius,
        ),
        textStyles: ImpaktfullUiHorizontalTabTextStylesTheme(
          selected: textStyles.onCardAccent.text.small.semiBold,
          unselected: textStyles.onCard.text.small.semiBold,
        ),
      );
}

class ImpaktfullUiHorizontalTabColorTheme {
  final Color backgroundUnSelectedTab;
  final Color backgroundSelectedTab;

  const ImpaktfullUiHorizontalTabColorTheme({
    required this.backgroundUnSelectedTab,
    required this.backgroundSelectedTab,
  });
}

class ImpaktfullUiHorizontalTabTextStylesTheme {
  final TextStyle selected;
  final TextStyle unselected;

  const ImpaktfullUiHorizontalTabTextStylesTheme({
    required this.selected,
    required this.unselected,
  });
}

class ImpaktfullUiHorizontalTabDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiHorizontalTabDimensTheme({
    required this.borderRadius,
  });
}
