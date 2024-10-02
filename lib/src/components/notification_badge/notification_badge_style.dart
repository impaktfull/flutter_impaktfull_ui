import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

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
}

class ImpaktfullUiNotificationBadgeAssetsTheme {
  const ImpaktfullUiNotificationBadgeAssetsTheme();
}

class ImpaktfullUiNotificationBadgeDimensTheme {
  final BorderRadius borderRadius;

  const ImpaktfullUiNotificationBadgeDimensTheme({
    required this.borderRadius,
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
