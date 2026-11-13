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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiIconButtonTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens;

  @override
  int get hashCode => Object.hash(assets, colors, dimens);
}

class ImpaktfullUiIconButtonAssetsTheme {
  const ImpaktfullUiIconButtonAssetsTheme();

  ImpaktfullUiIconButtonAssetsTheme copyWith() =>
      const ImpaktfullUiIconButtonAssetsTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiIconButtonAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiIconButtonColorTheme {
  /// The color of the icon when the icon button has no `color`. When null,
  /// the asset keeps its own color.
  final Color? icon;

  /// The background when the icon button has no `backgroundColor`.
  final Color? background;

  /// The color of the border when the icon button has no `borderColor`. When
  /// null (the default), the icon button has no border. The border is drawn
  /// inside the icon button with the `borderWidth` of the dimens theme, so
  /// it does not change the size of the icon button.
  final Color? border;

  /// The color of the notification badge when the icon button has no
  /// `notificationBadgeColor`. When null, the notification badge theme is
  /// used.
  final Color? notificationBadge;

  const ImpaktfullUiIconButtonColorTheme({
    this.icon,
    this.background,
    this.border,
    this.notificationBadge,
  });

  ImpaktfullUiIconButtonColorTheme copyWith({
    Color? background,
    Color? border,
    Color? icon,
    Color? notificationBadge,
  }) =>
      ImpaktfullUiIconButtonColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
        icon: icon ?? this.icon,
        notificationBadge: notificationBadge ?? this.notificationBadge,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiIconButtonColorTheme &&
          icon == other.icon &&
          background == other.background &&
          border == other.border &&
          notificationBadge == other.notificationBadge;

  @override
  int get hashCode => Object.hash(icon, background, border, notificationBadge);
}

class ImpaktfullUiIconButtonDimensTheme {
  /// The padding around the icon.
  final EdgeInsetsGeometry padding;

  /// The size of the icon when the icon button has no `size`.
  final double iconSize;

  /// The border radius of the touch feedback and the border.
  final BorderRadiusGeometry borderRadius;

  /// The width of the border. Only used when the icon button has a border
  /// color (`borderColor` or the `border` of the color theme). The border is
  /// drawn inside the icon button, over the outer edge of the [padding].
  final double borderWidth;

  /// The size of the notification badge.
  final double notificationBadgeSize;

  /// The opacity of a disabled icon button (without `onTap`).
  final double disabledOpacity;

  const ImpaktfullUiIconButtonDimensTheme({
    this.padding = const EdgeInsets.all(12),
    this.iconSize = 16,
    this.borderRadius = const BorderRadius.all(Radius.circular(9999)),
    this.borderWidth = 1,
    this.notificationBadgeSize = 8,
    this.disabledOpacity = 0.5,
  });

  ImpaktfullUiIconButtonDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    double? disabledOpacity,
    double? iconSize,
    double? notificationBadgeSize,
    EdgeInsetsGeometry? padding,
  }) =>
      ImpaktfullUiIconButtonDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        disabledOpacity: disabledOpacity ?? this.disabledOpacity,
        iconSize: iconSize ?? this.iconSize,
        notificationBadgeSize:
            notificationBadgeSize ?? this.notificationBadgeSize,
        padding: padding ?? this.padding,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiIconButtonDimensTheme &&
          padding == other.padding &&
          iconSize == other.iconSize &&
          borderRadius == other.borderRadius &&
          borderWidth == other.borderWidth &&
          notificationBadgeSize == other.notificationBadgeSize &&
          disabledOpacity == other.disabledOpacity;

  @override
  int get hashCode => Object.hash(padding, iconSize, borderRadius, borderWidth,
      notificationBadgeSize, disabledOpacity);
}
