import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiIconButtonTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiIconButtonAssetsTheme assets;
  final ImpaktfullUiIconButtonColorTheme colors;
  final ImpaktfullUiIconButtonDimensTheme dimens;

  const ImpaktfullUiIconButtonTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
  });

  /// The default look of the icon button. It does not depend on the base
  /// tokens of the theme.
  static const fallback = ImpaktfullUiIconButtonTheme(
    assets: ImpaktfullUiIconButtonAssetsTheme(),
    colors: ImpaktfullUiIconButtonColorTheme(),
    dimens: ImpaktfullUiIconButtonDimensTheme(),
  );

  ImpaktfullUiIconButtonTheme copyWith({
    ImpaktfullUiIconButtonAssetsTheme? assets,
    ImpaktfullUiIconButtonColorTheme? colors,
    ImpaktfullUiIconButtonDimensTheme? dimens,
  }) =>
      ImpaktfullUiIconButtonTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
      );

  static ImpaktfullUiIconButtonTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.iconButton;

  static ImpaktfullUiIconButtonTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      fallback;
}

class ImpaktfullUiIconButtonAssetsTheme {
  const ImpaktfullUiIconButtonAssetsTheme();

  ImpaktfullUiIconButtonAssetsTheme copyWith() =>
      const ImpaktfullUiIconButtonAssetsTheme();
}

class ImpaktfullUiIconButtonColorTheme {
  /// The color of the icon when the icon button has no `color`. When null,
  /// the asset keeps its own color.
  final Color? icon;

  /// The background when the icon button has no `backgroundColor`.
  final Color? background;

  /// The color of the notification badge when the icon button has no
  /// `notificationBadgeColor`. When null, the notification badge theme is
  /// used.
  final Color? notificationBadge;

  const ImpaktfullUiIconButtonColorTheme({
    this.icon,
    this.background,
    this.notificationBadge,
  });

  ImpaktfullUiIconButtonColorTheme copyWith({
    Color? icon,
    Color? background,
    Color? notificationBadge,
  }) =>
      ImpaktfullUiIconButtonColorTheme(
        icon: icon ?? this.icon,
        background: background ?? this.background,
        notificationBadge: notificationBadge ?? this.notificationBadge,
      );
}

class ImpaktfullUiIconButtonDimensTheme {
  /// The padding around the icon.
  final EdgeInsetsGeometry padding;

  /// The size of the icon when the icon button has no `size`.
  final double iconSize;

  /// The border radius of the touch feedback.
  final BorderRadiusGeometry borderRadius;

  /// The size of the notification badge.
  final double notificationBadgeSize;

  /// The opacity of a disabled icon button (without `onTap`).
  final double disabledOpacity;

  const ImpaktfullUiIconButtonDimensTheme({
    this.padding = const EdgeInsets.all(12),
    this.iconSize = 16,
    this.borderRadius = const BorderRadius.all(Radius.circular(9999)),
    this.notificationBadgeSize = 8,
    this.disabledOpacity = 0.5,
  });

  ImpaktfullUiIconButtonDimensTheme copyWith({
    EdgeInsetsGeometry? padding,
    double? iconSize,
    BorderRadiusGeometry? borderRadius,
    double? notificationBadgeSize,
    double? disabledOpacity,
  }) =>
      ImpaktfullUiIconButtonDimensTheme(
        padding: padding ?? this.padding,
        iconSize: iconSize ?? this.iconSize,
        borderRadius: borderRadius ?? this.borderRadius,
        notificationBadgeSize:
            notificationBadgeSize ?? this.notificationBadgeSize,
        disabledOpacity: disabledOpacity ?? this.disabledOpacity,
      );
}
