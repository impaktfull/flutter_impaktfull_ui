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
}

class ImpaktfullUiTimePickerAssetsTheme {
  const ImpaktfullUiTimePickerAssetsTheme();

  ImpaktfullUiTimePickerAssetsTheme copyWith() =>
      const ImpaktfullUiTimePickerAssetsTheme();
}

class ImpaktfullUiTimePickerColorTheme {
  const ImpaktfullUiTimePickerColorTheme();

  ImpaktfullUiTimePickerColorTheme copyWith() =>
      const ImpaktfullUiTimePickerColorTheme();
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
}

class ImpaktfullUiTimePickerTextStyleTheme {
  const ImpaktfullUiTimePickerTextStyleTheme();

  ImpaktfullUiTimePickerTextStyleTheme copyWith() =>
      const ImpaktfullUiTimePickerTextStyleTheme();
}
