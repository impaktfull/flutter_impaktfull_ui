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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCalendarTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCalendarAssetsTheme &&
          chevronLeft == other.chevronLeft &&
          chevronRight == other.chevronRight;

  @override
  int get hashCode => Object.hash(chevronLeft, chevronRight);
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCalendarColorTheme &&
          divider == other.divider &&
          eventBackground == other.eventBackground &&
          headerBackground == other.headerBackground;

  @override
  int get hashCode => Object.hash(divider, eventBackground, headerBackground);
}

class ImpaktfullUiCalendarDimensTheme {
  final double dividerHeight;
  final double sectionTitleWidth;
  final double weekHourHeight;
  final double weekEventMinHeightSmall;
  final double weekEventMinHeightExtraSmall;

  /// The padding around a day in the list view.
  final EdgeInsetsGeometry listPadding;

  /// The padding inside an event in the week view.
  final EdgeInsetsGeometry eventPadding;

  /// The space between the parts of an event.
  final double eventSpacing;

  /// The space between the title and the time of an event.
  final double eventContentSpacing;

  /// The space between the hours and the days next to them.
  final double hourSpacing;

  /// The space between the day and the date in the legend.
  final double legendSpacing;

  /// The space between the parts of an event in the list view.
  final double listEventSpacing;

  /// The space between the items of a day in the list view.
  final double listItemSpacing;

  const ImpaktfullUiCalendarDimensTheme({
    required this.dividerHeight,
    required this.sectionTitleWidth,
    required this.weekHourHeight,
    required this.weekEventMinHeightSmall,
    required this.weekEventMinHeightExtraSmall,
    this.listPadding = const EdgeInsets.all(16),
    this.eventPadding = const EdgeInsets.all(4),
    this.eventSpacing = 4,
    this.eventContentSpacing = 8,
    this.hourSpacing = 16,
    this.legendSpacing = 2,
    this.listEventSpacing = 12,
    this.listItemSpacing = 8,
  });

  ImpaktfullUiCalendarDimensTheme copyWith({
    double? dividerHeight,
    double? eventContentSpacing,
    EdgeInsetsGeometry? eventPadding,
    double? eventSpacing,
    double? hourSpacing,
    double? legendSpacing,
    double? listEventSpacing,
    double? listItemSpacing,
    EdgeInsetsGeometry? listPadding,
    double? sectionTitleWidth,
    double? weekEventMinHeightExtraSmall,
    double? weekEventMinHeightSmall,
    double? weekHourHeight,
  }) =>
      ImpaktfullUiCalendarDimensTheme(
        dividerHeight: dividerHeight ?? this.dividerHeight,
        eventContentSpacing: eventContentSpacing ?? this.eventContentSpacing,
        eventPadding: eventPadding ?? this.eventPadding,
        eventSpacing: eventSpacing ?? this.eventSpacing,
        hourSpacing: hourSpacing ?? this.hourSpacing,
        legendSpacing: legendSpacing ?? this.legendSpacing,
        listEventSpacing: listEventSpacing ?? this.listEventSpacing,
        listItemSpacing: listItemSpacing ?? this.listItemSpacing,
        listPadding: listPadding ?? this.listPadding,
        sectionTitleWidth: sectionTitleWidth ?? this.sectionTitleWidth,
        weekEventMinHeightExtraSmall:
            weekEventMinHeightExtraSmall ?? this.weekEventMinHeightExtraSmall,
        weekEventMinHeightSmall:
            weekEventMinHeightSmall ?? this.weekEventMinHeightSmall,
        weekHourHeight: weekHourHeight ?? this.weekHourHeight,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCalendarDimensTheme &&
          dividerHeight == other.dividerHeight &&
          sectionTitleWidth == other.sectionTitleWidth &&
          weekHourHeight == other.weekHourHeight &&
          weekEventMinHeightSmall == other.weekEventMinHeightSmall &&
          weekEventMinHeightExtraSmall == other.weekEventMinHeightExtraSmall &&
          listPadding == other.listPadding &&
          eventPadding == other.eventPadding &&
          eventSpacing == other.eventSpacing &&
          eventContentSpacing == other.eventContentSpacing &&
          hourSpacing == other.hourSpacing &&
          legendSpacing == other.legendSpacing &&
          listEventSpacing == other.listEventSpacing &&
          listItemSpacing == other.listItemSpacing;

  @override
  int get hashCode => Object.hash(
      dividerHeight,
      sectionTitleWidth,
      weekHourHeight,
      weekEventMinHeightSmall,
      weekEventMinHeightExtraSmall,
      listPadding,
      eventPadding,
      eventSpacing,
      eventContentSpacing,
      hourSpacing,
      legendSpacing,
      listEventSpacing,
      listItemSpacing);
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCalendarTextStyleTheme &&
          sectionTitle == other.sectionTitle &&
          sectionSubtitle == other.sectionSubtitle &&
          listItemTitle == other.listItemTitle &&
          listItemTitleSmall == other.listItemTitleSmall &&
          listItemSubtitle == other.listItemSubtitle &&
          listItemSubtitleSmall == other.listItemSubtitleSmall &&
          dayTitle == other.dayTitle &&
          dayOfTheWeekTitle == other.dayOfTheWeekTitle;

  @override
  int get hashCode => Object.hash(
      sectionTitle,
      sectionSubtitle,
      listItemTitle,
      listItemTitleSmall,
      listItemSubtitle,
      listItemSubtitleSmall,
      dayTitle,
      dayOfTheWeekTitle);
}
