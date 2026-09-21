import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiDateTimePickerTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiDateTimePickerAssetsTheme assets;
  final ImpaktfullUiDateTimePickerColorTheme colors;
  final ImpaktfullUiDateTimePickerDimensTheme dimens;
  final ImpaktfullUiDateTimePickerTextStyleTheme textStyles;

  const ImpaktfullUiDateTimePickerTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiDateTimePickerTheme copyWith({
    ImpaktfullUiDateTimePickerAssetsTheme? assets,
    ImpaktfullUiDateTimePickerColorTheme? colors,
    ImpaktfullUiDateTimePickerDimensTheme? dimens,
    ImpaktfullUiDateTimePickerTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiDateTimePickerTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiDateTimePickerTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.dateTimePicker;

  static ImpaktfullUiDateTimePickerTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUiDateTimePickerTheme(
        assets: ImpaktfullUiDateTimePickerAssetsTheme(),
        colors: ImpaktfullUiDateTimePickerColorTheme(),
        dimens: ImpaktfullUiDateTimePickerDimensTheme(),
        textStyles: ImpaktfullUiDateTimePickerTextStyleTheme(),
      );
}

class ImpaktfullUiDateTimePickerAssetsTheme {
  const ImpaktfullUiDateTimePickerAssetsTheme();

  ImpaktfullUiDateTimePickerAssetsTheme copyWith() =>
      const ImpaktfullUiDateTimePickerAssetsTheme();
}

class ImpaktfullUiDateTimePickerColorTheme {
  const ImpaktfullUiDateTimePickerColorTheme();

  ImpaktfullUiDateTimePickerColorTheme copyWith() =>
      const ImpaktfullUiDateTimePickerColorTheme();
}

class ImpaktfullUiDateTimePickerDimensTheme {
  const ImpaktfullUiDateTimePickerDimensTheme();

  ImpaktfullUiDateTimePickerDimensTheme copyWith() =>
      const ImpaktfullUiDateTimePickerDimensTheme();
}

class ImpaktfullUiDateTimePickerTextStyleTheme {
  const ImpaktfullUiDateTimePickerTextStyleTheme();

  ImpaktfullUiDateTimePickerTextStyleTheme copyWith() =>
      const ImpaktfullUiDateTimePickerTextStyleTheme();
}
