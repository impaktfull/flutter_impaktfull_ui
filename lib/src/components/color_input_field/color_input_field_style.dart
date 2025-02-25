import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiColorInputFieldTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiColorInputFieldAssetsTheme assets;
  final ImpaktfullUiColorInputFieldColorTheme colors;
  final ImpaktfullUiColorInputFieldDimensTheme dimens;
  final ImpaktfullUiColorInputFieldTextStyleTheme textStyles;

  const ImpaktfullUiColorInputFieldTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiColorInputFieldTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.colorInputField;

  static ImpaktfullUiColorInputFieldTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiColorInputFieldTheme(
        assets: const ImpaktfullUiColorInputFieldAssetsTheme(),
        colors: ImpaktfullUiColorInputFieldColorTheme(
          border: colors.border,
        ),
        dimens: ImpaktfullUiColorInputFieldDimensTheme(
          borderRadius: dimens.borderRadius,
        ),
        textStyles: const ImpaktfullUiColorInputFieldTextStyleTheme(),
      );
}

class ImpaktfullUiColorInputFieldAssetsTheme {
  const ImpaktfullUiColorInputFieldAssetsTheme();
}

class ImpaktfullUiColorInputFieldColorTheme {
  final Color border;

  const ImpaktfullUiColorInputFieldColorTheme({
    required this.border,
  });
}

class ImpaktfullUiColorInputFieldDimensTheme {
  final BorderRadiusGeometry borderRadius;

  const ImpaktfullUiColorInputFieldDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiColorInputFieldTextStyleTheme {
  const ImpaktfullUiColorInputFieldTextStyleTheme();
}
