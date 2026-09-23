import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiTimePickerTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTimePickerAssetsTheme assets;
  final ImpaktfullUiTimePickerColorTheme colors;
  final ImpaktfullUiTimePickerDimensTheme dimens;
  final ImpaktfullUiTimePickerTextStyleTheme textStyles;

  const ImpaktfullUiTimePickerTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiTimePickerTheme copyWith({
    ImpaktfullUiTimePickerAssetsTheme? assets,
    ImpaktfullUiTimePickerColorTheme? colors,
    ImpaktfullUiTimePickerDimensTheme? dimens,
    ImpaktfullUiTimePickerTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiTimePickerTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiTimePickerTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.timePicker;

  static ImpaktfullUiTimePickerTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiTimePickerTheme(
        assets: ImpaktfullUiTimePickerAssetsTheme(),
        colors: ImpaktfullUiTimePickerColorTheme(),
        dimens: ImpaktfullUiTimePickerDimensTheme(
          labelMargin: EdgeInsets.zero,
        ),
        textStyles: ImpaktfullUiTimePickerTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTimePickerTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiTimePickerAssetsTheme {
  const ImpaktfullUiTimePickerAssetsTheme();

  ImpaktfullUiTimePickerAssetsTheme copyWith() =>
      const ImpaktfullUiTimePickerAssetsTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiTimePickerAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiTimePickerColorTheme {
  const ImpaktfullUiTimePickerColorTheme();

  ImpaktfullUiTimePickerColorTheme copyWith() =>
      const ImpaktfullUiTimePickerColorTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiTimePickerColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiTimePickerDimensTheme {
  final EdgeInsets labelMargin;
  const ImpaktfullUiTimePickerDimensTheme({
    required this.labelMargin,
  });

  ImpaktfullUiTimePickerDimensTheme copyWith({
    EdgeInsets? labelMargin,
  }) =>
      ImpaktfullUiTimePickerDimensTheme(
          labelMargin: labelMargin ?? this.labelMargin);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTimePickerDimensTheme &&
          labelMargin == other.labelMargin;

  @override
  int get hashCode => labelMargin.hashCode;
}

class ImpaktfullUiTimePickerTextStyleTheme {
  const ImpaktfullUiTimePickerTextStyleTheme();

  ImpaktfullUiTimePickerTextStyleTheme copyWith() =>
      const ImpaktfullUiTimePickerTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiTimePickerTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
