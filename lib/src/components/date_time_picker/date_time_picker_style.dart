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
}

class ImpaktfullUiDateTimePickerColorTheme {
  const ImpaktfullUiDateTimePickerColorTheme();
}

class ImpaktfullUiDateTimePickerDimensTheme {
  const ImpaktfullUiDateTimePickerDimensTheme();
}

class ImpaktfullUiDateTimePickerTextStyleTheme {
  const ImpaktfullUiDateTimePickerTextStyleTheme();
}
