import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiDropdownTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiDropdownColorTheme colors;
  final ImpaktfullUiDropdownShadowTheme shadows;
  final ImpaktfullUiDropdownDimensTheme dimens;
  final ImpaktfullUiDropdownAssetsTheme assets;

  const ImpaktfullUiDropdownTheme({
    required this.colors,
    required this.shadows,
    required this.dimens,
    required this.assets,
  });

  ImpaktfullUiDropdownTheme copyWith({
    ImpaktfullUiDropdownAssetsTheme? assets,
    ImpaktfullUiDropdownColorTheme? colors,
    ImpaktfullUiDropdownDimensTheme? dimens,
    ImpaktfullUiDropdownShadowTheme? shadows,
  }) =>
      ImpaktfullUiDropdownTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
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
        shadows: ImpaktfullUiDropdownShadowTheme(
          overlay: shadows.large,
        ),
        dimens: ImpaktfullUiDropdownDimensTheme(
          borderRadius: dimens.borderRadius,
        ),
        assets: ImpaktfullUiDropdownAssetsTheme(
          dropDown: assets.icons.chevronDown,
          dropUp: assets.icons.chevronUp,
        ),
      );
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
}

class ImpaktfullUiDropdownShadowTheme {
  final List<BoxShadow> overlay;
  const ImpaktfullUiDropdownShadowTheme({
    required this.overlay,
  });

  ImpaktfullUiDropdownShadowTheme copyWith({
    List<BoxShadow>? overlay,
  }) =>
      ImpaktfullUiDropdownShadowTheme(
        overlay: overlay ?? this.overlay,
      );
}

class ImpaktfullUiDropdownDimensTheme {
  final BorderRadiusGeometry borderRadius;

  const ImpaktfullUiDropdownDimensTheme({
    required this.borderRadius,
  });

  ImpaktfullUiDropdownDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
  }) =>
      ImpaktfullUiDropdownDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
      );
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
}
