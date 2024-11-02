import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

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

  static ImpaktfullUiTimePickerTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.timePicker;
}

class ImpaktfullUiTimePickerAssetsTheme {
  const ImpaktfullUiTimePickerAssetsTheme();
}

class ImpaktfullUiTimePickerColorTheme {
  const ImpaktfullUiTimePickerColorTheme();
}

class ImpaktfullUiTimePickerDimensTheme {
  const ImpaktfullUiTimePickerDimensTheme();
}

class ImpaktfullUiTimePickerTextStyleTheme {
  const ImpaktfullUiTimePickerTextStyleTheme();
}
