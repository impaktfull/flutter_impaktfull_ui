import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/border_radius_geometry_extension.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

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

  ImpaktfullUiDatePickerTheme copyWith({
    ImpaktfullUiDatePickerAssetsTheme? assets,
    ImpaktfullUiDatePickerColorTheme? colors,
    ImpaktfullUiDatePickerDimensTheme? dimens,
    ImpaktfullUiDatePickerTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiDatePickerTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiDatePickerTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.datePicker;

  static ImpaktfullUiDatePickerTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiDatePickerTheme(
        assets: ImpaktfullUiDatePickerAssetsTheme(
          arrowLeft: assets.icons.arrowLeft,
          arrowRight: assets.icons.arrowRight,
        ),
        colors: ImpaktfullUiDatePickerColorTheme(
          selected: colors.accent,
          inRange: colors.accent.withOpacityPercentage(0.33),
        ),
        dimens: ImpaktfullUiDatePickerDimensTheme(
          borderRadius: dimens.borderRadius,
          borderRadiusRangeStart: dimens.borderRadius.copyWith(
            topEnd: Radius.zero,
            bottomEnd: Radius.zero,
          ),
          borderRadiusRangeEnd: dimens.borderRadius.copyWith(
            topStart: Radius.zero,
            bottomStart: Radius.zero,
          ),
          borderRadiusRangeBetween: BorderRadius.zero,
        ),
        textStyles: ImpaktfullUiDatePickerTextStyleTheme(
          headerTitle: textStyles.onCard.text.small.semiBold,
          weekday: textStyles.onCard.text.small.medium,
          cellInActive: textStyles.onCardTertiary.text.small.withOpacity(0.5),
          cellDisabled: textStyles.onCardTertiary.text.small.withOpacity(0.25),
          cell: textStyles.onCard.text.small,
          cellSelected: textStyles.onPrimary.text.small.semiBold,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDatePickerTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiDatePickerAssetsTheme {
  final ImpaktfullUiAsset arrowLeft;
  final ImpaktfullUiAsset arrowRight;
  const ImpaktfullUiDatePickerAssetsTheme({
    required this.arrowLeft,
    required this.arrowRight,
  });

  ImpaktfullUiDatePickerAssetsTheme copyWith({
    ImpaktfullUiAsset? arrowLeft,
    ImpaktfullUiAsset? arrowRight,
  }) =>
      ImpaktfullUiDatePickerAssetsTheme(
        arrowLeft: arrowLeft ?? this.arrowLeft,
        arrowRight: arrowRight ?? this.arrowRight,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDatePickerAssetsTheme &&
          arrowLeft == other.arrowLeft &&
          arrowRight == other.arrowRight;

  @override
  int get hashCode => Object.hash(arrowLeft, arrowRight);
}

class ImpaktfullUiDatePickerColorTheme {
  final Color selected;
  final Color inRange;
  const ImpaktfullUiDatePickerColorTheme({
    required this.selected,
    required this.inRange,
  });

  ImpaktfullUiDatePickerColorTheme copyWith({
    Color? inRange,
    Color? selected,
  }) =>
      ImpaktfullUiDatePickerColorTheme(
        inRange: inRange ?? this.inRange,
        selected: selected ?? this.selected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDatePickerColorTheme &&
          selected == other.selected &&
          inRange == other.inRange;

  @override
  int get hashCode => Object.hash(selected, inRange);
}

class ImpaktfullUiDatePickerDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final BorderRadiusGeometry borderRadiusRangeStart;
  final BorderRadiusGeometry borderRadiusRangeEnd;
  final BorderRadiusGeometry borderRadiusRangeBetween;

  /// The width of the date picker.
  final double width;

  /// The width of the grid of days, inside the margin.
  final double contentWidth;

  /// The height of the grid of days, inside the page.
  ///
  /// The page itself is [monthsHeight] high, the same for the days, the
  /// months and the years, so a value above that leaves the grid at the
  /// height of the page: the grid shrinks to fit instead of pushing the last
  /// week out of the picker.
  final double daysHeight;

  /// The height of a page of the picker: the list of months, the list of
  /// years and the grid of days with the row of weekdays above it.
  final double monthsHeight;

  /// The space between the header, the grid and the actions.
  final double spacing;

  /// The width of the border around the selected day.
  final double selectedBorderWidth;

  const ImpaktfullUiDatePickerDimensTheme({
    required this.borderRadius,
    required this.borderRadiusRangeStart,
    required this.borderRadiusRangeEnd,
    required this.borderRadiusRangeBetween,
    this.width = 310,
    this.contentWidth = 280,
    this.daysHeight = 280,
    this.monthsHeight = 260,
    this.spacing = 8,
    this.selectedBorderWidth = 2,
  });

  ImpaktfullUiDatePickerDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    BorderRadiusGeometry? borderRadiusRangeBetween,
    BorderRadiusGeometry? borderRadiusRangeEnd,
    BorderRadiusGeometry? borderRadiusRangeStart,
    double? contentWidth,
    double? daysHeight,
    double? monthsHeight,
    double? selectedBorderWidth,
    double? spacing,
    double? width,
  }) =>
      ImpaktfullUiDatePickerDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderRadiusRangeBetween:
            borderRadiusRangeBetween ?? this.borderRadiusRangeBetween,
        borderRadiusRangeEnd: borderRadiusRangeEnd ?? this.borderRadiusRangeEnd,
        borderRadiusRangeStart:
            borderRadiusRangeStart ?? this.borderRadiusRangeStart,
        contentWidth: contentWidth ?? this.contentWidth,
        daysHeight: daysHeight ?? this.daysHeight,
        monthsHeight: monthsHeight ?? this.monthsHeight,
        selectedBorderWidth: selectedBorderWidth ?? this.selectedBorderWidth,
        spacing: spacing ?? this.spacing,
        width: width ?? this.width,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDatePickerDimensTheme &&
          borderRadius == other.borderRadius &&
          borderRadiusRangeStart == other.borderRadiusRangeStart &&
          borderRadiusRangeEnd == other.borderRadiusRangeEnd &&
          borderRadiusRangeBetween == other.borderRadiusRangeBetween &&
          width == other.width &&
          contentWidth == other.contentWidth &&
          daysHeight == other.daysHeight &&
          monthsHeight == other.monthsHeight &&
          spacing == other.spacing &&
          selectedBorderWidth == other.selectedBorderWidth;

  @override
  int get hashCode => Object.hash(
      borderRadius,
      borderRadiusRangeStart,
      borderRadiusRangeEnd,
      borderRadiusRangeBetween,
      width,
      contentWidth,
      daysHeight,
      monthsHeight,
      spacing,
      selectedBorderWidth);
}

class ImpaktfullUiDatePickerTextStyleTheme {
  final TextStyle headerTitle;
  final TextStyle weekday;
  final TextStyle cellInActive;
  final TextStyle cell;
  final TextStyle cellSelected;

  /// The day, month or year that is outside `firstDate` / `lastDate`.
  ///
  /// Falls back to [cellInActive] when it is not set, so a theme that was
  /// written before `firstDate` / `lastDate` existed keeps working.
  final TextStyle? cellDisabled;

  const ImpaktfullUiDatePickerTextStyleTheme({
    required this.headerTitle,
    required this.weekday,
    required this.cellInActive,
    required this.cell,
    required this.cellSelected,
    this.cellDisabled,
  });

  ImpaktfullUiDatePickerTextStyleTheme copyWith({
    TextStyle? cell,
    TextStyle? cellInActive,
    TextStyle? cellDisabled,
    TextStyle? cellSelected,
    TextStyle? headerTitle,
    TextStyle? weekday,
  }) =>
      ImpaktfullUiDatePickerTextStyleTheme(
        cell: cell ?? this.cell,
        cellInActive: cellInActive ?? this.cellInActive,
        cellDisabled: cellDisabled ?? this.cellDisabled,
        cellSelected: cellSelected ?? this.cellSelected,
        headerTitle: headerTitle ?? this.headerTitle,
        weekday: weekday ?? this.weekday,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDatePickerTextStyleTheme &&
          headerTitle == other.headerTitle &&
          weekday == other.weekday &&
          cellInActive == other.cellInActive &&
          cell == other.cell &&
          cellSelected == other.cellSelected &&
          cellDisabled == other.cellDisabled;

  @override
  int get hashCode => Object.hash(
      headerTitle, weekday, cellInActive, cell, cellSelected, cellDisabled);
}
