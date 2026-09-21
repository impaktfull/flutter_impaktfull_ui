import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class ImpaktfullUiOptionSelectorTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiOptionSelectorAssetsTheme assets;
  final ImpaktfullUiOptionSelectorColorTheme colors;
  final ImpaktfullUiOptionSelectorDimensTheme dimens;
  final ImpaktfullUiOptionSelectorTextStyleTheme textStyles;

  const ImpaktfullUiOptionSelectorTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiOptionSelectorTheme copyWith({
    ImpaktfullUiOptionSelectorAssetsTheme? assets,
    ImpaktfullUiOptionSelectorColorTheme? colors,
    ImpaktfullUiOptionSelectorDimensTheme? dimens,
    ImpaktfullUiOptionSelectorTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiOptionSelectorTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiOptionSelectorTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.optionSelector;

  static ImpaktfullUiOptionSelectorTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUiOptionSelectorTheme(
        assets: ImpaktfullUiOptionSelectorAssetsTheme(),
        colors: ImpaktfullUiOptionSelectorColorTheme(),
        dimens: ImpaktfullUiOptionSelectorDimensTheme(),
        textStyles: ImpaktfullUiOptionSelectorTextStyleTheme(),
      );
}

class ImpaktfullUiOptionSelectorAssetsTheme {
  const ImpaktfullUiOptionSelectorAssetsTheme();

  ImpaktfullUiOptionSelectorAssetsTheme copyWith() =>
      const ImpaktfullUiOptionSelectorAssetsTheme();
}

class ImpaktfullUiOptionSelectorColorTheme {
  const ImpaktfullUiOptionSelectorColorTheme();

  ImpaktfullUiOptionSelectorColorTheme copyWith() =>
      const ImpaktfullUiOptionSelectorColorTheme();
}

class ImpaktfullUiOptionSelectorDimensTheme {
  const ImpaktfullUiOptionSelectorDimensTheme();

  ImpaktfullUiOptionSelectorDimensTheme copyWith() =>
      const ImpaktfullUiOptionSelectorDimensTheme();
}

class ImpaktfullUiOptionSelectorTextStyleTheme {
  const ImpaktfullUiOptionSelectorTextStyleTheme();

  ImpaktfullUiOptionSelectorTextStyleTheme copyWith() =>
      const ImpaktfullUiOptionSelectorTextStyleTheme();
}
