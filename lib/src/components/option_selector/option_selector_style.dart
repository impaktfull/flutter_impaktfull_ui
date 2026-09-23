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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiOptionSelectorTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiOptionSelectorAssetsTheme {
  const ImpaktfullUiOptionSelectorAssetsTheme();

  ImpaktfullUiOptionSelectorAssetsTheme copyWith() =>
      const ImpaktfullUiOptionSelectorAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiOptionSelectorAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiOptionSelectorColorTheme {
  const ImpaktfullUiOptionSelectorColorTheme();

  ImpaktfullUiOptionSelectorColorTheme copyWith() =>
      const ImpaktfullUiOptionSelectorColorTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiOptionSelectorColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiOptionSelectorDimensTheme {
  const ImpaktfullUiOptionSelectorDimensTheme();

  ImpaktfullUiOptionSelectorDimensTheme copyWith() =>
      const ImpaktfullUiOptionSelectorDimensTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiOptionSelectorDimensTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiOptionSelectorTextStyleTheme {
  const ImpaktfullUiOptionSelectorTextStyleTheme();

  ImpaktfullUiOptionSelectorTextStyleTheme copyWith() =>
      const ImpaktfullUiOptionSelectorTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiOptionSelectorTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
