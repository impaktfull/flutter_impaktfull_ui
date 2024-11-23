import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';
import 'package:impaktfull_ui_2/src/util/extension/text_style_extension.dart';

class ImpaktfullUiNotificationTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiNotificationAssetsTheme assets;
  final ImpaktfullUiNotificationColorTheme colors;
  final ImpaktfullUiNotificationDimensTheme dimens;
  final ImpaktfullUiNotificationShadowsTheme shadows;
  final ImpaktfullUiNotificationTextStyleTheme textStyles;

  const ImpaktfullUiNotificationTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.shadows,
    required this.textStyles,
  });

  static ImpaktfullUiNotificationTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.notification;

  static ImpaktfullUiNotificationTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiNotificationTheme(
        assets: ImpaktfullUiNotificationAssetsTheme(
          branded: assets.icons.confetti,
          chevronRight: assets.icons.chevronRight,
          close: assets.icons.close,
          error: assets.icons.error,
          info: assets.icons.info,
          success: assets.icons.success,
          warning: assets.icons.warning,
        ),
        colors: ImpaktfullUiNotificationColorTheme(
          background: colors.card,
          border: colors.border,
          shadow: colors.shadow,
          branded: colors.accent,
          error: colors.error,
          info: colors.info,
          success: colors.success,
          warning: colors.warning,
        ),
        dimens: ImpaktfullUiNotificationDimensTheme(
          borderRadius: dimens.borderRadius,
        ),
        shadows: ImpaktfullUiNotificationShadowsTheme(
          card: shadows.large,
        ),
        textStyles: ImpaktfullUiNotificationTextStyleTheme(
          title: textStyles.onCard.text.medium.bold,
          subtitle: textStyles.onCard.text.small,
        ),
      );
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

class ImpaktfullUiNotificationDimensTheme {
  final BorderRadiusGeometry borderRadius;

  const ImpaktfullUiNotificationDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiNotificationShadowsTheme {
  final List<BoxShadow> card;

  const ImpaktfullUiNotificationShadowsTheme({
    required this.card,
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
