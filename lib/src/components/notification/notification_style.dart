import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiNotificationTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiNotificationColorTheme colors;
  final ImpaktfullUiNotificationTextStyleTheme textStyles;
  final ImpaktfullUiNotificationDimensTheme dimens;
  final ImpaktfullUiNotificationAssetsTheme assets;

  const ImpaktfullUiNotificationTheme({
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.assets,
  });

  static ImpaktfullUiNotificationTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.notification;
}

class ImpaktfullUiNotificationColorTheme {
  final Color background;
  final Color? border;
  final Color shadow;
  final Color branded;
  final Color error;
  final Color info;
  final bool matchBorderWithType;
  final Color success;
  final Color warning;

  const ImpaktfullUiNotificationColorTheme({
    required this.background,
    required this.border,
    required this.shadow,
    required this.branded,
    required this.error,
    required this.info,
    this.matchBorderWithType = false,
    required this.success,
    required this.warning,
  });
}

class ImpaktfullUiNotificationTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;
  const ImpaktfullUiNotificationTextStyleTheme({
    required this.title,
    required this.subtitle,
  });
}

class ImpaktfullUiNotificationDimensTheme {
  final BorderRadiusGeometry borderRadius;

  const ImpaktfullUiNotificationDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiNotificationAssetsTheme {
  final ImpaktfullUiAsset? branded;
  final ImpaktfullUiAsset chevronRight;
  final ImpaktfullUiAsset close;
  final ImpaktfullUiAsset? error;
  final ImpaktfullUiAsset? info;
  final ImpaktfullUiAsset? success;
  final ImpaktfullUiAsset? warning;

  const ImpaktfullUiNotificationAssetsTheme({
    required this.branded,
    required this.chevronRight,
    required this.close,
    required this.error,
    required this.info,
    required this.success,
    required this.warning,
  });
}
