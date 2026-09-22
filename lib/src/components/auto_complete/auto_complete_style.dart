import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiAutoCompleteTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiAutoCompleteAssetsTheme assets;
  final ImpaktfullUiAutoCompleteColorTheme colors;
  final ImpaktfullUiAutoCompleteDimensTheme dimens;
  final ImpaktfullUiAutoCompleteShadowsTheme shadows;
  final ImpaktfullUiAutoCompleteTextStyleTheme textStyles;

  const ImpaktfullUiAutoCompleteTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.shadows,
    required this.textStyles,
  });

  ImpaktfullUiAutoCompleteTheme copyWith({
    ImpaktfullUiAutoCompleteAssetsTheme? assets,
    ImpaktfullUiAutoCompleteColorTheme? colors,
    ImpaktfullUiAutoCompleteDimensTheme? dimens,
    ImpaktfullUiAutoCompleteShadowsTheme? shadows,
    ImpaktfullUiAutoCompleteTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiAutoCompleteTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        shadows: shadows ?? this.shadows,
        textStyles: textStyles ?? this.textStyles,
      );

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
        shadows: ImpaktfullUiAutoCompleteShadowsTheme(
          overlay: shadows.large,
        ),
        textStyles: const ImpaktfullUiAutoCompleteTextStyleTheme(),
      );
}

class ImpaktfullUiAutoCompleteAssetsTheme {
  const ImpaktfullUiAutoCompleteAssetsTheme();

  ImpaktfullUiAutoCompleteAssetsTheme copyWith() =>
      const ImpaktfullUiAutoCompleteAssetsTheme();
}

class ImpaktfullUiAutoCompleteColorTheme {
  const ImpaktfullUiAutoCompleteColorTheme();

  ImpaktfullUiAutoCompleteColorTheme copyWith() =>
      const ImpaktfullUiAutoCompleteColorTheme();
}

class ImpaktfullUiAutoCompleteShadowsTheme {
  final List<BoxShadow> overlay;
  const ImpaktfullUiAutoCompleteShadowsTheme({
    required this.overlay,
  });

  ImpaktfullUiAutoCompleteShadowsTheme copyWith({
    List<BoxShadow>? overlay,
  }) =>
      ImpaktfullUiAutoCompleteShadowsTheme(
        overlay: overlay ?? this.overlay,
      );
}

class ImpaktfullUiAutoCompleteDimensTheme {
  const ImpaktfullUiAutoCompleteDimensTheme();

  ImpaktfullUiAutoCompleteDimensTheme copyWith() =>
      const ImpaktfullUiAutoCompleteDimensTheme();
}

class ImpaktfullUiAutoCompleteTextStyleTheme {
  const ImpaktfullUiAutoCompleteTextStyleTheme();

  ImpaktfullUiAutoCompleteTextStyleTheme copyWith() =>
      const ImpaktfullUiAutoCompleteTextStyleTheme();
}
