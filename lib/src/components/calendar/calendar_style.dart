import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiCalendarTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCalendarAssetsTheme assets;
  final ImpaktfullUiCalendarColorTheme colors;
  final ImpaktfullUiCalendarDimensTheme dimens;
  final ImpaktfullUiCalendarTextStyleTheme textStyles;

  const ImpaktfullUiCalendarTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiCalendarTheme copyWith({
    ImpaktfullUiCalendarAssetsTheme? assets,
    ImpaktfullUiCalendarColorTheme? colors,
    ImpaktfullUiCalendarDimensTheme? dimens,
    ImpaktfullUiCalendarTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiCalendarTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiCalendarTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.calendar;

  static ImpaktfullUiCalendarTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiCalendarTheme(
        assets: ImpaktfullUiCalendarAssetsTheme(
          chevronLeft: assets.icons.chevronLeft,
          chevronRight: assets.icons.chevronRight,
        ),
        colors: ImpaktfullUiCalendarColorTheme(
          divider: colors.border,
          headerBackground: colors.card,
          eventBackground: colors.card,
        ),
        dimens: const ImpaktfullUiCalendarDimensTheme(
          dividerHeight: 1,
          sectionTitleWidth: 60,
          weekHourHeight: 75,
          weekEventMinHeightSmall: 40,
          weekEventMinHeightExtraSmall: 25,
        ),
        textStyles: ImpaktfullUiCalendarTextStyleTheme(
          sectionTitle: textStyles.onCanvas.text.small.semiBold,
          sectionSubtitle: textStyles.onCanvasTertiary.text.extraSmall.light,
          listItemTitle: textStyles.onCard.text.small,
          listItemTitleSmall: textStyles.onCard.text.extraSmall,
          listItemSubtitle: textStyles.onCanvasTertiary.text.small.light,
          listItemSubtitleSmall:
              textStyles.onCanvasTertiary.text.extraSmall.light,
          dayTitle: textStyles.onCanvas.text.extraSmall.semiBold,
          dayOfTheWeekTitle: textStyles.onCanvas.text.extraSmall,
        ),
      );
}

class ImpaktfullUiCalendarAssetsTheme {
  final ImpaktfullUiAsset chevronLeft;
  final ImpaktfullUiAsset chevronRight;

  const ImpaktfullUiCalendarAssetsTheme({
    required this.chevronLeft,
    required this.chevronRight,
  });

  ImpaktfullUiCalendarAssetsTheme copyWith({
    ImpaktfullUiAsset? chevronLeft,
    ImpaktfullUiAsset? chevronRight,
  }) =>
      ImpaktfullUiCalendarAssetsTheme(
        chevronLeft: chevronLeft ?? this.chevronLeft,
        chevronRight: chevronRight ?? this.chevronRight,
      );
}

class ImpaktfullUiCalendarColorTheme {
  final Color divider;
  final Color eventBackground;
  final Color headerBackground;

  const ImpaktfullUiCalendarColorTheme({
    required this.divider,
    required this.eventBackground,
    required this.headerBackground,
  });

  ImpaktfullUiCalendarColorTheme copyWith({
    Color? divider,
    Color? eventBackground,
    Color? headerBackground,
  }) =>
      ImpaktfullUiCalendarColorTheme(
        divider: divider ?? this.divider,
        eventBackground: eventBackground ?? this.eventBackground,
        headerBackground: headerBackground ?? this.headerBackground,
      );
}

class ImpaktfullUiCalendarDimensTheme {
  final double dividerHeight;
  final double sectionTitleWidth;
  final double weekHourHeight;
  final double weekEventMinHeightSmall;
  final double weekEventMinHeightExtraSmall;

  const ImpaktfullUiCalendarDimensTheme({
    required this.dividerHeight,
    required this.sectionTitleWidth,
    required this.weekHourHeight,
    required this.weekEventMinHeightSmall,
    required this.weekEventMinHeightExtraSmall,
  });

  ImpaktfullUiCalendarDimensTheme copyWith({
    double? dividerHeight,
    double? sectionTitleWidth,
    double? weekEventMinHeightExtraSmall,
    double? weekEventMinHeightSmall,
    double? weekHourHeight,
  }) =>
      ImpaktfullUiCalendarDimensTheme(
        dividerHeight: dividerHeight ?? this.dividerHeight,
        sectionTitleWidth: sectionTitleWidth ?? this.sectionTitleWidth,
        weekEventMinHeightExtraSmall:
            weekEventMinHeightExtraSmall ?? this.weekEventMinHeightExtraSmall,
        weekEventMinHeightSmall:
            weekEventMinHeightSmall ?? this.weekEventMinHeightSmall,
        weekHourHeight: weekHourHeight ?? this.weekHourHeight,
      );
}

class ImpaktfullUiCalendarTextStyleTheme {
  final TextStyle sectionTitle;
  final TextStyle sectionSubtitle;
  final TextStyle listItemTitle;
  final TextStyle listItemTitleSmall;
  final TextStyle listItemSubtitle;
  final TextStyle listItemSubtitleSmall;
  final TextStyle dayTitle;
  final TextStyle dayOfTheWeekTitle;

  const ImpaktfullUiCalendarTextStyleTheme({
    required this.sectionTitle,
    required this.sectionSubtitle,
    required this.listItemTitle,
    required this.listItemTitleSmall,
    required this.listItemSubtitle,
    required this.listItemSubtitleSmall,
    required this.dayTitle,
    required this.dayOfTheWeekTitle,
  });

  ImpaktfullUiCalendarTextStyleTheme copyWith({
    TextStyle? dayOfTheWeekTitle,
    TextStyle? dayTitle,
    TextStyle? listItemSubtitle,
    TextStyle? listItemSubtitleSmall,
    TextStyle? listItemTitle,
    TextStyle? listItemTitleSmall,
    TextStyle? sectionSubtitle,
    TextStyle? sectionTitle,
  }) =>
      ImpaktfullUiCalendarTextStyleTheme(
        dayOfTheWeekTitle: dayOfTheWeekTitle ?? this.dayOfTheWeekTitle,
        dayTitle: dayTitle ?? this.dayTitle,
        listItemSubtitle: listItemSubtitle ?? this.listItemSubtitle,
        listItemSubtitleSmall:
            listItemSubtitleSmall ?? this.listItemSubtitleSmall,
        listItemTitle: listItemTitle ?? this.listItemTitle,
        listItemTitleSmall: listItemTitleSmall ?? this.listItemTitleSmall,
        sectionSubtitle: sectionSubtitle ?? this.sectionSubtitle,
        sectionTitle: sectionTitle ?? this.sectionTitle,
      );
}
