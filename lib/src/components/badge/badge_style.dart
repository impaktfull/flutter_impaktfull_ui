import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';

class ImpaktfullUiBadgeTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiBadgeAssetsTheme assets;
  final ImpaktfullUiBadgeColorTheme colors;
  final ImpaktfullUiBadgeDimensTheme dimens;
  final ImpaktfullUiBadgeTextStyleTheme textStyles;

  const ImpaktfullUiBadgeTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiBadgeTheme copyWith({
    ImpaktfullUiBadgeAssetsTheme? assets,
    ImpaktfullUiBadgeColorTheme? colors,
    ImpaktfullUiBadgeDimensTheme? dimens,
    ImpaktfullUiBadgeTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiBadgeTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

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
        textStyles: ImpaktfullUiBadgeTextStyleTheme(
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

  ImpaktfullUiBadgeAssetsTheme copyWith({
    ImpaktfullUiAsset? close,
  }) =>
      ImpaktfullUiBadgeAssetsTheme(
        close: close ?? this.close,
      );
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

  ImpaktfullUiBadgeColorTheme copyWith({
    Color? errorBackground,
    Color? errorBorder,
    Color? errorText,
    Color? neutralBackground,
    Color? neutralBorder,
    Color? neutralText,
    Color? primaryBackground,
    Color? primaryBorder,
    Color? primaryText,
    Color? secondaryBackground,
    Color? secondaryBorder,
    Color? secondaryText,
    Color? successBackground,
    Color? successBorder,
    Color? successText,
    Color? warningBackground,
    Color? warningBorder,
    Color? warningText,
  }) =>
      ImpaktfullUiBadgeColorTheme(
        errorBackground: errorBackground ?? this.errorBackground,
        errorBorder: errorBorder ?? this.errorBorder,
        errorText: errorText ?? this.errorText,
        neutralBackground: neutralBackground ?? this.neutralBackground,
        neutralBorder: neutralBorder ?? this.neutralBorder,
        neutralText: neutralText ?? this.neutralText,
        primaryBackground: primaryBackground ?? this.primaryBackground,
        primaryBorder: primaryBorder ?? this.primaryBorder,
        primaryText: primaryText ?? this.primaryText,
        secondaryBackground: secondaryBackground ?? this.secondaryBackground,
        secondaryBorder: secondaryBorder ?? this.secondaryBorder,
        secondaryText: secondaryText ?? this.secondaryText,
        successBackground: successBackground ?? this.successBackground,
        successBorder: successBorder ?? this.successBorder,
        successText: successText ?? this.successText,
        warningBackground: warningBackground ?? this.warningBackground,
        warningBorder: warningBorder ?? this.warningBorder,
        warningText: warningText ?? this.warningText,
      );
}

class ImpaktfullUiBadgeDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final double borderWidth;

  /// The size of the icon of the close button.
  final double closeIconSize;

  /// The padding around the icon of the close button.
  final EdgeInsetsGeometry closePadding;

  /// The space between the title and the close button.
  final double closeSpacing;

  const ImpaktfullUiBadgeDimensTheme({
    required this.borderRadius,
    required this.borderWidth,
    this.closeIconSize = 16,
    this.closePadding = const EdgeInsets.all(2),
    this.closeSpacing = 2,
  });

  ImpaktfullUiBadgeDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    double? closeIconSize,
    EdgeInsetsGeometry? closePadding,
    double? closeSpacing,
  }) =>
      ImpaktfullUiBadgeDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        closeIconSize: closeIconSize ?? this.closeIconSize,
        closePadding: closePadding ?? this.closePadding,
        closeSpacing: closeSpacing ?? this.closeSpacing,
      );
}

class ImpaktfullUiBadgeTextStyleTheme {
  final TextStyle small;
  final TextStyle medium;
  final TextStyle large;

  const ImpaktfullUiBadgeTextStyleTheme({
    required this.small,
    required this.medium,
    required this.large,
  });

  ImpaktfullUiBadgeTextStyleTheme copyWith({
    TextStyle? large,
    TextStyle? medium,
    TextStyle? small,
  }) =>
      ImpaktfullUiBadgeTextStyleTheme(
        large: large ?? this.large,
        medium: medium ?? this.medium,
        small: small ?? this.small,
      );
}
