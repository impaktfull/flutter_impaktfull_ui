import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSelectableListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSelectableListItemAssetsTheme assets;
  final ImpaktfullUiSelectableListItemColorTheme colors;
  final ImpaktfullUiSelectableListItemDimensTheme dimens;
  final ImpaktfullUiSelectableListItemDurationsTheme durations;
  final ImpaktfullUiSelectableListItemTextStyleTheme textStyles;

  const ImpaktfullUiSelectableListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

  static ImpaktfullUiSelectableListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.selectableListItem;
}

class ImpaktfullUiSelectableListItemAssetsTheme {
  final ImpaktfullUiAsset check;
  const ImpaktfullUiSelectableListItemAssetsTheme({
    required this.check,
  });
}

class ImpaktfullUiSelectableListItemColorTheme {
  final Color icons;
  final Color selected;
  final Color unselected;
  const ImpaktfullUiSelectableListItemColorTheme({
    required this.icons,
    required this.selected,
    required this.unselected,
  });
}

class ImpaktfullUiSelectableListItemDimensTheme {
  const ImpaktfullUiSelectableListItemDimensTheme();
}

class ImpaktfullUiSelectableListItemDurationsTheme {
  final Duration color;
  const ImpaktfullUiSelectableListItemDurationsTheme({
    required this.color,
  });
}

class ImpaktfullUiSelectableListItemTextStyleTheme {
  const ImpaktfullUiSelectableListItemTextStyleTheme();
}
