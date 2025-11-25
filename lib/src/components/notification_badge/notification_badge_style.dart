import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiNotificationBadgeTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiNotificationBadgeAssetsTheme assets;
  final ImpaktfullUiNotificationBadgeColorTheme colors;
  final ImpaktfullUiNotificationBadgeDimensTheme dimens;
  final ImpaktfullUiNotificationBadgeDurationTheme durations;
  final ImpaktfullUiNotificationBadgeTextStyleTheme textStyles;

  const ImpaktfullUiNotificationBadgeTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

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
      durations: ImpaktfullUiNotificationBadgeDurationTheme(
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
}

class ImpaktfullUiNotificationBadgeDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsets textPadding;

  const ImpaktfullUiNotificationBadgeDimensTheme({
    required this.borderRadius,
    required this.textPadding,
  });
}

class ImpaktfullUiNotificationBadgeDurationTheme {
  final Duration opacity;

  const ImpaktfullUiNotificationBadgeDurationTheme({
    required this.opacity,
  });
}

class ImpaktfullUiNotificationBadgeColorTheme {
  final Color background;
  final Color? border;

  const ImpaktfullUiNotificationBadgeColorTheme({
    required this.background,
    required this.border,
  });
}

class ImpaktfullUiNotificationBadgeTextStyleTheme {
  final TextStyle text;

  const ImpaktfullUiNotificationBadgeTextStyleTheme({
    required this.text,
  });
}
