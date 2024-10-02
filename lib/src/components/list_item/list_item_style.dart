import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiListItemAssetsTheme assets;
  final ImpaktfullUiListItemColorTheme colors;
  final ImpaktfullUiListItemDimensTheme dimens;
  final ImpaktfullUiListItemTextStyleTheme textStyles;

  const ImpaktfullUiListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.listItem;
}

class ImpaktfullUiListItemAssetsTheme {
  const ImpaktfullUiListItemAssetsTheme();
}

class ImpaktfullUiListItemColorTheme {
  const ImpaktfullUiListItemColorTheme();
}

class ImpaktfullUiListItemDimensTheme {
  const ImpaktfullUiListItemDimensTheme();
}

class ImpaktfullUiListItemTextStyleTheme {
  const ImpaktfullUiListItemTextStyleTheme();
}