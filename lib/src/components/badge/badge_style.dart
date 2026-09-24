import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/badge/badge_size.dart';
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBadgeTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBadgeAssetsTheme && close == other.close;

  @override
  int get hashCode => close.hashCode;
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBadgeColorTheme &&
          primaryText == other.primaryText &&
          primaryBorder == other.primaryBorder &&
          primaryBackground == other.primaryBackground &&
          secondaryText == other.secondaryText &&
          secondaryBorder == other.secondaryBorder &&
          secondaryBackground == other.secondaryBackground &&
          neutralText == other.neutralText &&
          neutralBorder == other.neutralBorder &&
          neutralBackground == other.neutralBackground &&
          errorText == other.errorText &&
          errorBorder == other.errorBorder &&
          errorBackground == other.errorBackground &&
          warningText == other.warningText &&
          warningBorder == other.warningBorder &&
          warningBackground == other.warningBackground &&
          successText == other.successText &&
          successBorder == other.successBorder &&
          successBackground == other.successBackground;

  @override
  int get hashCode => Object.hash(
      primaryText,
      primaryBorder,
      primaryBackground,
      secondaryText,
      secondaryBorder,
      secondaryBackground,
      neutralText,
      neutralBorder,
      neutralBackground,
      errorText,
      errorBorder,
      errorBackground,
      warningText,
      warningBorder,
      warningBackground,
      successText,
      successBorder,
      successBackground);
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

  /// The geometry of the badge per [ImpaktfullUiBadgeSize].
  final ImpaktfullUiBadgeSizesDimensTheme sizes;

  const ImpaktfullUiBadgeDimensTheme({
    required this.borderRadius,
    required this.borderWidth,
    this.closeIconSize = 16,
    this.closePadding = const EdgeInsets.all(2),
    this.closeSpacing = 2,
    this.sizes = const ImpaktfullUiBadgeSizesDimensTheme(),
  });

  ImpaktfullUiBadgeDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    double? closeIconSize,
    EdgeInsetsGeometry? closePadding,
    double? closeSpacing,
    ImpaktfullUiBadgeSizesDimensTheme? sizes,
  }) =>
      ImpaktfullUiBadgeDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        closeIconSize: closeIconSize ?? this.closeIconSize,
        closePadding: closePadding ?? this.closePadding,
        closeSpacing: closeSpacing ?? this.closeSpacing,
        sizes: sizes ?? this.sizes,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBadgeDimensTheme &&
          borderRadius == other.borderRadius &&
          borderWidth == other.borderWidth &&
          closeIconSize == other.closeIconSize &&
          closePadding == other.closePadding &&
          closeSpacing == other.closeSpacing &&
          sizes == other.sizes;

  @override
  int get hashCode => Object.hash(borderRadius, borderWidth, closeIconSize,
      closePadding, closeSpacing, sizes);
}

/// The geometry of `ImpaktfullUiBadge` per [ImpaktfullUiBadgeSize].
class ImpaktfullUiBadgeSizesDimensTheme {
  final ImpaktfullUiBadgeSizeDimensTheme small;
  final ImpaktfullUiBadgeSizeDimensTheme medium;
  final ImpaktfullUiBadgeSizeDimensTheme large;

  const ImpaktfullUiBadgeSizesDimensTheme({
    this.small = const ImpaktfullUiBadgeSizeDimensTheme(
      horizontalPadding: 8,
      verticalPadding: 2,
      paddingOffset: 0,
      spacing: 4,
      widgetSize: 16,
    ),
    this.medium = const ImpaktfullUiBadgeSizeDimensTheme(
      horizontalPadding: 10,
      verticalPadding: 2,
      paddingOffset: 1,
      spacing: 6,
      widgetSize: 18,
    ),
    this.large = const ImpaktfullUiBadgeSizeDimensTheme(
      horizontalPadding: 12,
      verticalPadding: 4,
      paddingOffset: 2,
      spacing: 6,
      widgetSize: 24,
    ),
  });

  /// The geometry of [size].
  ImpaktfullUiBadgeSizeDimensTheme bySize(ImpaktfullUiBadgeSize size) {
    switch (size) {
      case ImpaktfullUiBadgeSize.small:
        return small;
      case ImpaktfullUiBadgeSize.medium:
        return medium;
      case ImpaktfullUiBadgeSize.large:
        return large;
    }
  }

  ImpaktfullUiBadgeSizesDimensTheme copyWith({
    ImpaktfullUiBadgeSizeDimensTheme? large,
    ImpaktfullUiBadgeSizeDimensTheme? medium,
    ImpaktfullUiBadgeSizeDimensTheme? small,
  }) =>
      ImpaktfullUiBadgeSizesDimensTheme(
        large: large ?? this.large,
        medium: medium ?? this.medium,
        small: small ?? this.small,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBadgeSizesDimensTheme &&
          small == other.small &&
          medium == other.medium &&
          large == other.large;

  @override
  int get hashCode => Object.hash(small, medium, large);
}

/// The geometry of one [ImpaktfullUiBadgeSize]. Before these tokens existed
/// the values lived on the [ImpaktfullUiBadgeSize] enum, which an app can not
/// change.
class ImpaktfullUiBadgeSizeDimensTheme {
  /// The padding before and after the content of the badge. A side with a
  /// leading or a trailing widget uses `horizontalPadding / 2 - paddingOffset`
  /// instead, because the icon brings its own whitespace.
  final double horizontalPadding;

  /// The padding above and below the content of the badge.
  final double verticalPadding;

  /// How much the padding of a side with a leading or a trailing widget is
  /// pulled in, see [horizontalPadding].
  final double paddingOffset;

  /// The space between the title and a leading or a trailing widget.
  final double spacing;

  /// The size of a leading or a trailing widget, icon or asset.
  final double widgetSize;

  const ImpaktfullUiBadgeSizeDimensTheme({
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.spacing,
    required this.widgetSize,
    this.paddingOffset = 0,
  });

  ImpaktfullUiBadgeSizeDimensTheme copyWith({
    double? horizontalPadding,
    double? paddingOffset,
    double? spacing,
    double? verticalPadding,
    double? widgetSize,
  }) =>
      ImpaktfullUiBadgeSizeDimensTheme(
        horizontalPadding: horizontalPadding ?? this.horizontalPadding,
        paddingOffset: paddingOffset ?? this.paddingOffset,
        spacing: spacing ?? this.spacing,
        verticalPadding: verticalPadding ?? this.verticalPadding,
        widgetSize: widgetSize ?? this.widgetSize,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBadgeSizeDimensTheme &&
          horizontalPadding == other.horizontalPadding &&
          verticalPadding == other.verticalPadding &&
          paddingOffset == other.paddingOffset &&
          spacing == other.spacing &&
          widgetSize == other.widgetSize;

  @override
  int get hashCode => Object.hash(
      horizontalPadding, verticalPadding, paddingOffset, spacing, widgetSize);
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBadgeTextStyleTheme &&
          small == other.small &&
          medium == other.medium &&
          large == other.large;

  @override
  int get hashCode => Object.hash(small, medium, large);
}
