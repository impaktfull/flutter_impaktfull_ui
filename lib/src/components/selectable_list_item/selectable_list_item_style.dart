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

  ImpaktfullUiSelectableListItemTheme copyWith({
    ImpaktfullUiSelectableListItemAssetsTheme? assets,
    ImpaktfullUiSelectableListItemColorTheme? colors,
    ImpaktfullUiSelectableListItemDimensTheme? dimens,
    ImpaktfullUiSelectableListItemDurationsTheme? durations,
    ImpaktfullUiSelectableListItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSelectableListItemTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );
}

class ImpaktfullUiSelectableListItemAssetsTheme {
  final ImpaktfullUiAsset check;
  const ImpaktfullUiSelectableListItemAssetsTheme({
    required this.check,
  });
}

class ImpaktfullUiSelectableListItemColorTheme {
  final Color? icons;
  final Color selected;
  final Color unselected;
  const ImpaktfullUiSelectableListItemColorTheme({
    required this.icons,
    required this.selected,
    required this.unselected,
  });
}

class ImpaktfullUiSelectableListItemDimensTheme {
  final double? leadingHeight;
  final double? leadingWidth;
  final double? trailingHeight;
  final double? trailingWidth;

  const ImpaktfullUiSelectableListItemDimensTheme({
    this.leadingHeight,
    this.leadingWidth,
    this.trailingHeight,
    this.trailingWidth,
  });
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
