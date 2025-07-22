import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';

class ImpaktfullUiBadgeTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiBadgeAssetsTheme assets;
  final ImpaktfullUiBadgeColorTheme colors;
  final ImpaktfullUiBadgeDimensTheme dimens;
  final ImpaktfullUiBadgeTextStylesTheme textStyles;

  const ImpaktfullUiBadgeTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiBadgeTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.badge;

  static ImpaktfullUiBadgeTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiBadgeTheme(
        assets: ImpaktfullUiBadgeAssetsTheme(
          close: assets.icons.close,
        ),
        colors: ImpaktfullUiBadgeColorTheme(
          primaryText: colors.accent,
          primaryBorder: colors.accent,
          primaryBackground: colors.accent.withOpacityPercentage(0.05),
          secondaryText: colors.secondary,
          secondaryBorder: colors.secondary.withOpacityPercentage(0.5),
          secondaryBackground: colors.secondary.withOpacityPercentage(0.05),
          neutralText: colors.text,
          neutralBorder: colors.border,
          neutralBackground: colors.border.withOpacityPercentage(0.05),
          errorText: colors.error,
          errorBorder: colors.error.withOpacityPercentage(0.5),
          errorBackground: colors.error.withOpacityPercentage(0.05),
          warningText: colors.warning,
          warningBorder: colors.warning.withOpacityPercentage(0.5),
          warningBackground: colors.warning.withOpacityPercentage(0.05),
          successText: colors.success,
          successBorder: colors.success.withOpacityPercentage(0.5),
          successBackground: colors.success.withOpacityPercentage(0.05),
        ),
        dimens: ImpaktfullUiBadgeDimensTheme(
          borderRadius: dimens.borderRadiusCircle,
          borderWidth: 1,
        ),
        textStyles: ImpaktfullUiBadgeTextStylesTheme(
          small: textStyles.onCard.text.small,
          medium: textStyles.onCard.text.small,
          large: textStyles.onCard.text.small,
        ),
      );
}

class ImpaktfullUiBadgeAssetsTheme {
  final ImpaktfullUiAsset close;

  const ImpaktfullUiBadgeAssetsTheme({
    required this.close,
  });
}

class ImpaktfullUiBadgeColorTheme {
  final Color primaryText;
  final Color primaryBorder;
  final Color primaryBackground;
  final Color secondaryText;
  final Color secondaryBorder;
  final Color secondaryBackground;
  final Color neutralText;
  final Color neutralBorder;
  final Color neutralBackground;
  final Color errorText;
  final Color errorBorder;
  final Color errorBackground;
  final Color warningText;
  final Color warningBorder;
  final Color warningBackground;
  final Color successText;
  final Color successBorder;
  final Color successBackground;

  const ImpaktfullUiBadgeColorTheme({
    required this.primaryText,
    required this.primaryBorder,
    required this.primaryBackground,
    required this.secondaryText,
    required this.secondaryBorder,
    required this.secondaryBackground,
    required this.neutralText,
    required this.neutralBorder,
    required this.neutralBackground,
    required this.errorText,
    required this.errorBorder,
    required this.errorBackground,
    required this.warningText,
    required this.warningBorder,
    required this.warningBackground,
    required this.successText,
    required this.successBorder,
    required this.successBackground,
  });
}

class ImpaktfullUiBadgeDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final double borderWidth;

  const ImpaktfullUiBadgeDimensTheme({
    required this.borderRadius,
    required this.borderWidth,
  });
}

class ImpaktfullUiBadgeTextStylesTheme {
  final TextStyle small;
  final TextStyle medium;
  final TextStyle large;

  const ImpaktfullUiBadgeTextStylesTheme({
    required this.small,
    required this.medium,
    required this.large,
  });
}
