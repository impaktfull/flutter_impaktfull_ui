import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiAutoCompleteTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiAutoCompleteAssetsTheme assets;
  final ImpaktfullUiAutoCompleteColorTheme colors;
  final ImpaktfullUiAutoCompleteDimensTheme dimens;
  final ImpaktfullUiAutoCompleteShadowTheme shadows;
  final ImpaktfullUiAutoCompleteTextStyleTheme textStyles;

  const ImpaktfullUiAutoCompleteTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.shadows,
    required this.textStyles,
  });

  static ImpaktfullUiAutoCompleteTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.autoComplete;

  static ImpaktfullUiAutoCompleteTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiAutoCompleteTheme(
        assets: const ImpaktfullUiAutoCompleteAssetsTheme(),
        colors: const ImpaktfullUiAutoCompleteColorTheme(),
        dimens: const ImpaktfullUiAutoCompleteDimensTheme(),
        shadows: ImpaktfullUiAutoCompleteShadowTheme(
          overlay: shadows.large,
        ),
        textStyles: const ImpaktfullUiAutoCompleteTextStyleTheme(),
      );
}

class ImpaktfullUiAutoCompleteAssetsTheme {
  const ImpaktfullUiAutoCompleteAssetsTheme();
}

class ImpaktfullUiAutoCompleteColorTheme {
  const ImpaktfullUiAutoCompleteColorTheme();
}

class ImpaktfullUiAutoCompleteShadowTheme {
  final List<BoxShadow> overlay;
  const ImpaktfullUiAutoCompleteShadowTheme({
    required this.overlay,
  });
}

class ImpaktfullUiAutoCompleteDimensTheme {
  const ImpaktfullUiAutoCompleteDimensTheme();
}

class ImpaktfullUiAutoCompleteTextStyleTheme {
  const ImpaktfullUiAutoCompleteTextStyleTheme();
}
