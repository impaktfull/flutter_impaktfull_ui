import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiCommandMenuTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCommandMenuAssetsTheme assets;
  final ImpaktfullUiCommandMenuColorTheme colors;
  final ImpaktfullUiCommandMenuDimensTheme dimens;
  final ImpaktfullUiCommandMenuTextStyleTheme textStyles;

  const ImpaktfullUiCommandMenuTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiCommandMenuTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.commandMenu;

  static ImpaktfullUiCommandMenuTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiCommandMenuTheme(
        assets: const ImpaktfullUiCommandMenuAssetsTheme(),
        colors: const ImpaktfullUiCommandMenuColorTheme(),
        dimens: ImpaktfullUiCommandMenuDimensTheme(
          windowBorderRadius: dimens.borderRadiusLarge,
        ),
        textStyles: const ImpaktfullUiCommandMenuTextStyleTheme(),
      );
}

class ImpaktfullUiCommandMenuAssetsTheme {
  const ImpaktfullUiCommandMenuAssetsTheme();
}

class ImpaktfullUiCommandMenuColorTheme {
  const ImpaktfullUiCommandMenuColorTheme();
}

class ImpaktfullUiCommandMenuDimensTheme {
  final BorderRadiusGeometry windowBorderRadius;

  const ImpaktfullUiCommandMenuDimensTheme({
    required this.windowBorderRadius,
  });
}

class ImpaktfullUiCommandMenuTextStyleTheme {
  const ImpaktfullUiCommandMenuTextStyleTheme();
}
