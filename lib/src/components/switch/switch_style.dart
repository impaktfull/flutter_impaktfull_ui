import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSwitchTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSwitchColorTheme colors;
  final ImpaktfullUiSwitchTextStyleTheme textStyles;
  final ImpaktfullUiSwitchDimensTheme dimens;
  final ImpaktfullUiSwitchDurationsTheme durations;
  final ImpaktfullUiSwitchAssetsTheme assets;

  const ImpaktfullUiSwitchTheme({
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.durations,
    required this.assets,
  });

  ImpaktfullUiSwitchTheme copyWith({
    ImpaktfullUiSwitchAssetsTheme? assets,
    ImpaktfullUiSwitchColorTheme? colors,
    ImpaktfullUiSwitchDimensTheme? dimens,
    ImpaktfullUiSwitchDurationsTheme? durations,
    ImpaktfullUiSwitchTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSwitchTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiSwitchTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.switchTheme;

  static ImpaktfullUiSwitchTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSwitchTheme(
        colors: ImpaktfullUiSwitchColorTheme(
          inactiveBackground: colors.border,
          activeBackground: colors.accent,
          active: colors.card,
          inactive: colors.card,
          border: colors.border,
          accessibleInactiveIcon: colors.text,
          accessibleActiveIcon: colors.accent,
        ),
        textStyles: const ImpaktfullUiSwitchTextStyleTheme(),
        dimens: ImpaktfullUiSwitchDimensTheme(
          verticalPadding: 4,
          horizontalPadding: 20,
          borderRadius: dimens.borderRadius,
          thumbBorderRadius: dimens.borderRadiusExtraSmall,
          borderWidth: 0,
        ),
        durations: ImpaktfullUiSwitchDurationsTheme(
          selected: durations.short,
        ),
        assets: ImpaktfullUiSwitchAssetsTheme(
          active: assets.icons.check,
          inactive: assets.icons.close,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSwitchTheme &&
          colors == other.colors &&
          textStyles == other.textStyles &&
          dimens == other.dimens &&
          durations == other.durations &&
          assets == other.assets;

  @override
  int get hashCode =>
      Object.hash(colors, textStyles, dimens, durations, assets);
}

class ImpaktfullUiSwitchColorTheme {
  final Color inactiveBackground;
  final Color activeBackground;
  final Color active;
  final Color inactive;
  final Color border;
  final Color accessibleInactiveIcon;
  final Color accessibleActiveIcon;

  const ImpaktfullUiSwitchColorTheme({
    required this.inactiveBackground,
    required this.activeBackground,
    required this.active,
    required this.inactive,
    required this.border,
    required this.accessibleInactiveIcon,
    required this.accessibleActiveIcon,
  });

  ImpaktfullUiSwitchColorTheme copyWith({
    Color? accessibleActiveIcon,
    Color? accessibleInactiveIcon,
    Color? active,
    Color? activeBackground,
    Color? border,
    Color? inactive,
    Color? inactiveBackground,
  }) =>
      ImpaktfullUiSwitchColorTheme(
        accessibleActiveIcon: accessibleActiveIcon ?? this.accessibleActiveIcon,
        accessibleInactiveIcon:
            accessibleInactiveIcon ?? this.accessibleInactiveIcon,
        active: active ?? this.active,
        activeBackground: activeBackground ?? this.activeBackground,
        border: border ?? this.border,
        inactive: inactive ?? this.inactive,
        inactiveBackground: inactiveBackground ?? this.inactiveBackground,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSwitchColorTheme &&
          inactiveBackground == other.inactiveBackground &&
          activeBackground == other.activeBackground &&
          active == other.active &&
          inactive == other.inactive &&
          border == other.border &&
          accessibleInactiveIcon == other.accessibleInactiveIcon &&
          accessibleActiveIcon == other.accessibleActiveIcon;

  @override
  int get hashCode => Object.hash(inactiveBackground, activeBackground, active,
      inactive, border, accessibleInactiveIcon, accessibleActiveIcon);
}

class ImpaktfullUiSwitchTextStyleTheme {
  const ImpaktfullUiSwitchTextStyleTheme();

  ImpaktfullUiSwitchTextStyleTheme copyWith() =>
      const ImpaktfullUiSwitchTextStyleTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiSwitchTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiSwitchDimensTheme {
  final BorderRadiusGeometry? borderRadius;
  final BorderRadiusGeometry? thumbBorderRadius;
  final double? borderWidth;
  final double verticalPadding;
  final double horizontalPadding;

  /// Opt-in: the minimum size of the tap area, e.g. `Size.square(48)` for
  /// the Android and `Size.square(44)` for the iOS tap target guideline.
  ///
  /// The switch looks the same, but takes at least this much space in the
  /// layout. Null (the default) keeps the size of the switch.
  final Size? minTapTargetSize;

  const ImpaktfullUiSwitchDimensTheme({
    required this.verticalPadding,
    required this.horizontalPadding,
    this.borderRadius,
    this.thumbBorderRadius,
    this.borderWidth,
    this.minTapTargetSize,
  });

  ImpaktfullUiSwitchDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    double? horizontalPadding,
    Size? minTapTargetSize,
    BorderRadiusGeometry? thumbBorderRadius,
    double? verticalPadding,
  }) =>
      ImpaktfullUiSwitchDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        horizontalPadding: horizontalPadding ?? this.horizontalPadding,
        minTapTargetSize: minTapTargetSize ?? this.minTapTargetSize,
        thumbBorderRadius: thumbBorderRadius ?? this.thumbBorderRadius,
        verticalPadding: verticalPadding ?? this.verticalPadding,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSwitchDimensTheme &&
          borderRadius == other.borderRadius &&
          thumbBorderRadius == other.thumbBorderRadius &&
          borderWidth == other.borderWidth &&
          verticalPadding == other.verticalPadding &&
          horizontalPadding == other.horizontalPadding &&
          minTapTargetSize == other.minTapTargetSize;

  @override
  int get hashCode => Object.hash(borderRadius, thumbBorderRadius, borderWidth,
      verticalPadding, horizontalPadding, minTapTargetSize);
}

class ImpaktfullUiSwitchDurationsTheme {
  final Duration selected;
  const ImpaktfullUiSwitchDurationsTheme({
    required this.selected,
  });

  ImpaktfullUiSwitchDurationsTheme copyWith({
    Duration? selected,
  }) =>
      ImpaktfullUiSwitchDurationsTheme(
        selected: selected ?? this.selected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSwitchDurationsTheme && selected == other.selected;

  @override
  int get hashCode => selected.hashCode;
}

class ImpaktfullUiSwitchAssetsTheme {
  final ImpaktfullUiAsset active;
  final ImpaktfullUiAsset inactive;

  const ImpaktfullUiSwitchAssetsTheme({
    required this.active,
    required this.inactive,
  });

  ImpaktfullUiSwitchAssetsTheme copyWith({
    ImpaktfullUiAsset? active,
    ImpaktfullUiAsset? inactive,
  }) =>
      ImpaktfullUiSwitchAssetsTheme(
        active: active ?? this.active,
        inactive: inactive ?? this.inactive,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSwitchAssetsTheme &&
          active == other.active &&
          inactive == other.inactive;

  @override
  int get hashCode => Object.hash(active, inactive);
}
