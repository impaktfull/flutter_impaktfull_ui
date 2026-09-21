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
          cell: textStyles.onCard.text.small,
          cellSelected: textStyles.onPrimary.text.small.semiBold,
        ),
      );
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

  ImpaktfullUiDatePickerDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    BorderRadiusGeometry? borderRadiusRangeBetween,
    BorderRadiusGeometry? borderRadiusRangeEnd,
    BorderRadiusGeometry? borderRadiusRangeStart,
  }) =>
      ImpaktfullUiDatePickerDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderRadiusRangeBetween:
            borderRadiusRangeBetween ?? this.borderRadiusRangeBetween,
        borderRadiusRangeEnd: borderRadiusRangeEnd ?? this.borderRadiusRangeEnd,
        borderRadiusRangeStart:
            borderRadiusRangeStart ?? this.borderRadiusRangeStart,
      );
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

  ImpaktfullUiDatePickerTextStyleTheme copyWith({
    TextStyle? cell,
    TextStyle? cellInActive,
    TextStyle? cellSelected,
    TextStyle? headerTitle,
    TextStyle? weekday,
  }) =>
      ImpaktfullUiDatePickerTextStyleTheme(
        cell: cell ?? this.cell,
        cellInActive: cellInActive ?? this.cellInActive,
        cellSelected: cellSelected ?? this.cellSelected,
        headerTitle: headerTitle ?? this.headerTitle,
        weekday: weekday ?? this.weekday,
      );
}
