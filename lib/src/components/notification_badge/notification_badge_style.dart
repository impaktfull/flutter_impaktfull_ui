import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiNotificationBadgeTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiNotificationBadgeAssetsTheme assets;
  final ImpaktfullUiNotificationBadgeColorTheme colors;
  final ImpaktfullUiNotificationBadgeDimensTheme dimens;
  final ImpaktfullUiNotificationBadgeDurationsTheme durations;
  final ImpaktfullUiNotificationBadgeTextStyleTheme textStyles;

  const ImpaktfullUiNotificationBadgeTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

  ImpaktfullUiNotificationBadgeTheme copyWith({
    ImpaktfullUiNotificationBadgeAssetsTheme? assets,
    ImpaktfullUiNotificationBadgeColorTheme? colors,
    ImpaktfullUiNotificationBadgeDimensTheme? dimens,
    ImpaktfullUiNotificationBadgeDurationsTheme? durations,
    ImpaktfullUiNotificationBadgeTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiNotificationBadgeTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiNotificationBadgeTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.notificationBadge;

  static ImpaktfullUiNotificationBadgeTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) {
    return ImpaktfullUiNotificationBadgeTheme(
      assets: const ImpaktfullUiNotificationBadgeAssetsTheme(),
      colors: ImpaktfullUiNotificationBadgeColorTheme(
        background: colors.primary,
        border: colors.card,
      ),
      dimens: ImpaktfullUiNotificationBadgeDimensTheme(
        borderRadius: dimens.borderRadius,
        textPadding: const EdgeInsets.symmetric(horizontal: 8),
      ),
      durations: ImpaktfullUiNotificationBadgeDurationsTheme(
        opacity: durations.short,
      ),
      textStyles: ImpaktfullUiNotificationBadgeTextStyleTheme(
        text: textStyles.onPrimary.text.small,
      ),
    );
  }
}

class ImpaktfullUiNotificationBadgeAssetsTheme {
  const ImpaktfullUiNotificationBadgeAssetsTheme();

  ImpaktfullUiNotificationBadgeAssetsTheme copyWith() =>
      const ImpaktfullUiNotificationBadgeAssetsTheme();
}

class ImpaktfullUiNotificationBadgeDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsets textPadding;

  const ImpaktfullUiNotificationBadgeDimensTheme({
    required this.borderRadius,
    required this.textPadding,
  });

  ImpaktfullUiNotificationBadgeDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    EdgeInsets? textPadding,
  }) =>
      ImpaktfullUiNotificationBadgeDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        textPadding: textPadding ?? this.textPadding,
      );
}

class ImpaktfullUiNotificationBadgeDurationsTheme {
  final Duration opacity;

  const ImpaktfullUiNotificationBadgeDurationsTheme({
    required this.opacity,
  });

  ImpaktfullUiNotificationBadgeDurationsTheme copyWith({
    Duration? opacity,
  }) =>
      ImpaktfullUiNotificationBadgeDurationsTheme(
        opacity: opacity ?? this.opacity,
      );
}

class ImpaktfullUiNotificationBadgeColorTheme {
  final Color background;
  final Color? border;

  const ImpaktfullUiNotificationBadgeColorTheme({
    required this.background,
    required this.border,
  });

  ImpaktfullUiNotificationBadgeColorTheme copyWith({
    Color? background,
    Color? border,
  }) =>
      ImpaktfullUiNotificationBadgeColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
      );
}

class ImpaktfullUiNotificationBadgeTextStyleTheme {
  final TextStyle text;

  const ImpaktfullUiNotificationBadgeTextStyleTheme({
    required this.text,
  });

  ImpaktfullUiNotificationBadgeTextStyleTheme copyWith({
    TextStyle? text,
  }) =>
      ImpaktfullUiNotificationBadgeTextStyleTheme(
        text: text ?? this.text,
      );
}
