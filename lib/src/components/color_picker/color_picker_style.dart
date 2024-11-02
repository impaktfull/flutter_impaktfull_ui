import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiColorPickerTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiColorPickerAssetsTheme assets;
  final ImpaktfullUiColorPickerColorTheme colors;
  final ImpaktfullUiColorPickerDimensTheme dimens;
  final ImpaktfullUiColorPickerTextStyleTheme textStyles;

  const ImpaktfullUiColorPickerTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiColorPickerTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.colorPicker;
}

class ImpaktfullUiColorPickerAssetsTheme {
  const ImpaktfullUiColorPickerAssetsTheme();
}

class ImpaktfullUiColorPickerColorTheme {
  const ImpaktfullUiColorPickerColorTheme();
}

class ImpaktfullUiColorPickerDimensTheme {
  final BorderRadiusGeometry simpleColorPickerItemBorderRadius;
  final double simpleColorPickerItemSize;

  const ImpaktfullUiColorPickerDimensTheme({
    required this.simpleColorPickerItemBorderRadius,
    required this.simpleColorPickerItemSize,
  });
}

class ImpaktfullUiColorPickerTextStyleTheme {
  const ImpaktfullUiColorPickerTextStyleTheme();
}
