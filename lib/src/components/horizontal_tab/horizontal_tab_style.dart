import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiHorizontalTabTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiHorizontalTabColorTheme colors;
  final ImpaktfullUiHorizontalTabTextStyleTheme textStyles;
  final ImpaktfullUiHorizontalTabDimensTheme dimens;

  const ImpaktfullUiHorizontalTabTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiHorizontalTabTheme copyWith({
    ImpaktfullUiHorizontalTabColorTheme? colors,
    ImpaktfullUiHorizontalTabDimensTheme? dimens,
    ImpaktfullUiHorizontalTabTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiHorizontalTabTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

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
        textStyles: ImpaktfullUiHorizontalTabTextStyleTheme(
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

  ImpaktfullUiHorizontalTabColorTheme copyWith({
    Color? backgroundSelectedTab,
    Color? backgroundUnSelectedTab,
  }) =>
      ImpaktfullUiHorizontalTabColorTheme(
        backgroundSelectedTab:
            backgroundSelectedTab ?? this.backgroundSelectedTab,
        backgroundUnSelectedTab:
            backgroundUnSelectedTab ?? this.backgroundUnSelectedTab,
      );
}

class ImpaktfullUiHorizontalTabTextStyleTheme {
  final TextStyle selected;
  final TextStyle unselected;

  const ImpaktfullUiHorizontalTabTextStyleTheme({
    required this.selected,
    required this.unselected,
  });

  ImpaktfullUiHorizontalTabTextStyleTheme copyWith({
    TextStyle? selected,
    TextStyle? unselected,
  }) =>
      ImpaktfullUiHorizontalTabTextStyleTheme(
        selected: selected ?? this.selected,
        unselected: unselected ?? this.unselected,
      );
}

class ImpaktfullUiHorizontalTabDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiHorizontalTabDimensTheme({
    required this.borderRadius,
  });

  ImpaktfullUiHorizontalTabDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
  }) =>
      ImpaktfullUiHorizontalTabDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
      );
}
