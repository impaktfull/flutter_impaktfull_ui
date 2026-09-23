import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiDropdownTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiDropdownColorTheme colors;
  final ImpaktfullUiDropdownShadowsTheme shadows;
  final ImpaktfullUiDropdownDimensTheme dimens;
  final ImpaktfullUiDropdownDurationsTheme durations;
  final ImpaktfullUiDropdownAssetsTheme assets;

  const ImpaktfullUiDropdownTheme({
    required this.colors,
    required this.shadows,
    required this.dimens,
    this.durations = const ImpaktfullUiDropdownDurationsTheme(),
    required this.assets,
  });

  ImpaktfullUiDropdownTheme copyWith({
    ImpaktfullUiDropdownAssetsTheme? assets,
    ImpaktfullUiDropdownColorTheme? colors,
    ImpaktfullUiDropdownDimensTheme? dimens,
    ImpaktfullUiDropdownDurationsTheme? durations,
    ImpaktfullUiDropdownShadowsTheme? shadows,
  }) =>
      ImpaktfullUiDropdownTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        shadows: shadows ?? this.shadows,
      );

  static ImpaktfullUiDropdownTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.dropdown;

  static ImpaktfullUiDropdownTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiDropdownTheme(
        colors: ImpaktfullUiDropdownColorTheme(
          menuBackground: colors.card,
          menuBorder: colors.border,
        ),
        shadows: ImpaktfullUiDropdownShadowsTheme(
          overlay: shadows.large,
        ),
        dimens: ImpaktfullUiDropdownDimensTheme(
          borderRadius: dimens.borderRadius,
        ),
        assets: ImpaktfullUiDropdownAssetsTheme(
          dropDown: assets.icons.chevronDown,
          dropUp: assets.icons.chevronUp,
        ),
        durations: const ImpaktfullUiDropdownDurationsTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDropdownTheme &&
          colors == other.colors &&
          shadows == other.shadows &&
          dimens == other.dimens &&
          durations == other.durations &&
          assets == other.assets;

  @override
  int get hashCode => Object.hash(colors, shadows, dimens, durations, assets);
}

class ImpaktfullUiDropdownColorTheme {
  final Color menuBackground;
  final Color menuBorder;

  const ImpaktfullUiDropdownColorTheme({
    required this.menuBackground,
    required this.menuBorder,
  });

  ImpaktfullUiDropdownColorTheme copyWith({
    Color? menuBackground,
    Color? menuBorder,
  }) =>
      ImpaktfullUiDropdownColorTheme(
        menuBackground: menuBackground ?? this.menuBackground,
        menuBorder: menuBorder ?? this.menuBorder,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDropdownColorTheme &&
          menuBackground == other.menuBackground &&
          menuBorder == other.menuBorder;

  @override
  int get hashCode => Object.hash(menuBackground, menuBorder);
}

class ImpaktfullUiDropdownDurationsTheme {
  /// How long the overlay takes to open and to close.
  final Duration overlay;

  const ImpaktfullUiDropdownDurationsTheme({
    this.overlay = const Duration(milliseconds: 200),
  });

  ImpaktfullUiDropdownDurationsTheme copyWith({
    Duration? overlay,
  }) =>
      ImpaktfullUiDropdownDurationsTheme(
        overlay: overlay ?? this.overlay,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDropdownDurationsTheme && overlay == other.overlay;

  @override
  int get hashCode => overlay.hashCode;
}

class ImpaktfullUiDropdownShadowsTheme {
  final List<BoxShadow> overlay;
  const ImpaktfullUiDropdownShadowsTheme({
    required this.overlay,
  });

  ImpaktfullUiDropdownShadowsTheme copyWith({
    List<BoxShadow>? overlay,
  }) =>
      ImpaktfullUiDropdownShadowsTheme(
        overlay: overlay ?? this.overlay,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDropdownShadowsTheme &&
          listEquals(overlay, other.overlay);

  @override
  int get hashCode => Object.hashAll(overlay);
}

class ImpaktfullUiDropdownDimensTheme {
  final BorderRadiusGeometry borderRadius;

  /// The width of the overlay when the dropdown has no `childWidth` and the
  /// button has no width yet.
  final double overlayWidth;

  const ImpaktfullUiDropdownDimensTheme({
    required this.borderRadius,
    this.overlayWidth = 200,
  });

  ImpaktfullUiDropdownDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? overlayWidth,
  }) =>
      ImpaktfullUiDropdownDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        overlayWidth: overlayWidth ?? this.overlayWidth,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDropdownDimensTheme &&
          borderRadius == other.borderRadius &&
          overlayWidth == other.overlayWidth;

  @override
  int get hashCode => Object.hash(borderRadius, overlayWidth);
}

class ImpaktfullUiDropdownAssetsTheme {
  final ImpaktfullUiAsset dropDown;
  final ImpaktfullUiAsset dropUp;

  const ImpaktfullUiDropdownAssetsTheme({
    required this.dropDown,
    required this.dropUp,
  });

  ImpaktfullUiDropdownAssetsTheme copyWith({
    ImpaktfullUiAsset? dropDown,
    ImpaktfullUiAsset? dropUp,
  }) =>
      ImpaktfullUiDropdownAssetsTheme(
        dropDown: dropDown ?? this.dropDown,
        dropUp: dropUp ?? this.dropUp,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDropdownAssetsTheme &&
          dropDown == other.dropDown &&
          dropUp == other.dropUp;

  @override
  int get hashCode => Object.hash(dropDown, dropUp);
}
