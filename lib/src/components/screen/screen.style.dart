import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiScreenTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiScreenAssetsTheme assets;
  final ImpaktfullUiScreenColorTheme colors;
  final ImpaktfullUiScreenDimensTheme dimens;
  final ImpaktfullUiScreenTextStyleTheme textStyles;

  const ImpaktfullUiScreenTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiScreenTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.screen;

  static ImpaktfullUiScreenTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiScreenTheme(
        assets: const ImpaktfullUiScreenAssetsTheme(),
        colors: ImpaktfullUiScreenColorTheme(
          background: colors.canvas,
        ),
        dimens: const ImpaktfullUiScreenDimensTheme(),
        textStyles: const ImpaktfullUiScreenTextStyleTheme(),
      );
}

class ImpaktfullUiScreenAssetsTheme {
  const ImpaktfullUiScreenAssetsTheme();
}

class ImpaktfullUiScreenColorTheme {
  final Color background;
  const ImpaktfullUiScreenColorTheme({
    required this.background,
  });
}

class ImpaktfullUiScreenDimensTheme {
  const ImpaktfullUiScreenDimensTheme();
}

class ImpaktfullUiScreenTextStyleTheme {
  const ImpaktfullUiScreenTextStyleTheme();
}
