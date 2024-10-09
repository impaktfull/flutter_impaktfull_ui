import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiDatePickerTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiDatePickerAssetsTheme assets;
  final ImpaktfullUiDatePickerColorTheme colors;
  final ImpaktfullUiDatePickerDimensTheme dimens;
  final ImpaktfullUiDatePickerTextStyleTheme textStyles;

  const ImpaktfullUiDatePickerTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiDatePickerTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.datePicker;
}

class ImpaktfullUiDatePickerAssetsTheme {
  final ImpaktfullUiAsset arrowLeft;
  final ImpaktfullUiAsset arrowRight;
  const ImpaktfullUiDatePickerAssetsTheme({
    required this.arrowLeft,
    required this.arrowRight,
  });
}

class ImpaktfullUiDatePickerColorTheme {
  final Color selected;
  final Color inRange;
  const ImpaktfullUiDatePickerColorTheme({
    required this.selected,
    required this.inRange,
  });
}

class ImpaktfullUiDatePickerDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final BorderRadiusGeometry borderRadiusRangeStart;
  final BorderRadiusGeometry borderRadiusRangeEnd;
  final BorderRadiusGeometry borderRadiusRangeBetween;
  const ImpaktfullUiDatePickerDimensTheme({
    required this.borderRadius,
    required this.borderRadiusRangeStart,
    required this.borderRadiusRangeEnd,
    required this.borderRadiusRangeBetween,
  });
}

class ImpaktfullUiDatePickerTextStyleTheme {
  final TextStyle headerTitle;
  final TextStyle weekday;
  final TextStyle cellInActive;
  final TextStyle cell;
  final TextStyle cellSelected;

  const ImpaktfullUiDatePickerTextStyleTheme({
    required this.headerTitle,
    required this.weekday,
    required this.cellInActive,
    required this.cell,
    required this.cellSelected,
  });
}
