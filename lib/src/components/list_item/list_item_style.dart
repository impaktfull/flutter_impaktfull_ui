import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

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
  final ImpaktfullUiAsset chevronRight;

  const ImpaktfullUiListItemAssetsTheme({
    required this.chevronRight,
  });
}

class ImpaktfullUiListItemColorTheme {
  final Color icons;
  final Color danger;
  const ImpaktfullUiListItemColorTheme({
    required this.icons,
    required this.danger,
  });
}

class ImpaktfullUiListItemDimensTheme {
  final double? leadingSize;
  const ImpaktfullUiListItemDimensTheme({
    this.leadingSize,
  });
}

class ImpaktfullUiListItemTextStyleTheme {
  const ImpaktfullUiListItemTextStyleTheme();
}
