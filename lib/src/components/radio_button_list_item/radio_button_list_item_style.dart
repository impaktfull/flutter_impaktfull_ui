import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiRadioButtonListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiRadioButtonListItemAssetsTheme assets;
  final ImpaktfullUiRadioButtonListItemColorTheme colors;
  final ImpaktfullUiRadioButtonListItemDimensTheme dimens;
  final ImpaktfullUiRadioButtonListItemTextStyleTheme textStyles;

  const ImpaktfullUiRadioButtonListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiRadioButtonListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.radioButtonListItem;
}

class ImpaktfullUiRadioButtonListItemAssetsTheme {
  const ImpaktfullUiRadioButtonListItemAssetsTheme();
}

class ImpaktfullUiRadioButtonListItemColorTheme {
  final Color icons;
  const ImpaktfullUiRadioButtonListItemColorTheme({
    required this.icons,
  });
}

class ImpaktfullUiRadioButtonListItemDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiRadioButtonListItemDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiRadioButtonListItemTextStyleTheme {
  const ImpaktfullUiRadioButtonListItemTextStyleTheme();
}
