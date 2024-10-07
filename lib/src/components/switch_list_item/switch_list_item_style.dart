import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiSwitchListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSwitchListItemAssetsTheme assets;
  final ImpaktfullUiSwitchListItemColorTheme colors;
  final ImpaktfullUiSwitchListItemDimensTheme dimens;
  final ImpaktfullUiSwitchListItemTextStyleTheme textStyles;

  const ImpaktfullUiSwitchListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiSwitchListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.switchListItem;
}

class ImpaktfullUiSwitchListItemAssetsTheme {
  const ImpaktfullUiSwitchListItemAssetsTheme();
}

class ImpaktfullUiSwitchListItemColorTheme {
  final Color icons;
  const ImpaktfullUiSwitchListItemColorTheme({
    required this.icons,
  });
}

class ImpaktfullUiSwitchListItemDimensTheme {
  const ImpaktfullUiSwitchListItemDimensTheme();
}

class ImpaktfullUiSwitchListItemTextStyleTheme {
  const ImpaktfullUiSwitchListItemTextStyleTheme();
}
