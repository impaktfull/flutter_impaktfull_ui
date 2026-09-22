// Deprecated extensions that were exported to every app.
//
// They add unprefixed members (`format`, `isSameDay`, `tomorrow`, `bold`, ...)
// to DateTime, TextStyle, BorderRadiusGeometry and EdgeInsetsGeometry of every
// app that imports this package, where they can clash with the app's own
// extensions. 1.0.0 no longer exports them: copy the ones you use into your
// app. See doc/migrations/1.0.0.md.
//
// The analyzer only reports the use of a member of an extension when the
// member itself is deprecated (the annotation on the extension is only
// reported for an explicit `DateTimeExtensions(date).format(...)`), so every
// member is deprecated as well.
//
// The library uses the internal copies in lib/src/util/extension/ instead,
// which are not exported. A file must never import both: their members have
// the same names, so every use would be ambiguous. That is why this file
// imports them with a prefix and calls them explicitly.
//
// Only exported from lib/impaktfull_ui.dart. Remove this file and its export
// in 1.0.0.
import 'package:flutter/painting.dart';
import 'package:impaktfull_ui/src/util/extension/border_radius_geometry_extension.dart'
    as border_radius;
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart'
    as date_time;
import 'package:impaktfull_ui/src/util/extension/edge_insets_geometry_extension.dart'
    as edge_insets;
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart'
    as text_style;

const _notExported =
    'This extension will no longer be exported in 1.0.0. Copy it into your app if you use it.';

// BorderRadiusGeometry

@Deprecated(_notExported)
extension BorderRadiusGeometryExtension on BorderRadiusGeometry {
  @Deprecated(_notExported)
  Radius get topStart =>
      border_radius.InternalBorderRadiusGeometryExtension(this).topStart;

  @Deprecated(_notExported)
  Radius get topEnd =>
      border_radius.InternalBorderRadiusGeometryExtension(this).topEnd;

  @Deprecated(_notExported)
  Radius get bottomStart =>
      border_radius.InternalBorderRadiusGeometryExtension(this).bottomStart;

  @Deprecated(_notExported)
  Radius get bottomEnd =>
      border_radius.InternalBorderRadiusGeometryExtension(this).bottomEnd;

  @Deprecated(_notExported)
  BorderRadius get value =>
      border_radius.InternalBorderRadiusGeometryExtension(this).value;

  @Deprecated(_notExported)
  BorderRadiusGeometry copyWith({
    Radius? topStart,
    Radius? topEnd,
    Radius? bottomStart,
    Radius? bottomEnd,
  }) =>
      border_radius.InternalBorderRadiusGeometryExtension(this).copyWith(
        topStart: topStart,
        topEnd: topEnd,
        bottomStart: bottomStart,
        bottomEnd: bottomEnd,
      );
}

// DateTime

@Deprecated(_notExported)
extension DateTimeExtensions on DateTime {
  @Deprecated(_notExported)
  DateTime get startOfTheDay =>
      date_time.InternalDateTimeExtension(this).startOfTheDay;

  @Deprecated(_notExported)
  DateTime get endOfTheDay =>
      date_time.InternalDateTimeExtension(this).endOfTheDay;

  @Deprecated(_notExported)
  DateTime get tomorrow => date_time.InternalDateTimeExtension(this).tomorrow;

  @Deprecated(_notExported)
  DateTime get nextWeek => date_time.InternalDateTimeExtension(this).nextWeek;

  @Deprecated(_notExported)
  DateTime get yesterday => date_time.InternalDateTimeExtension(this).yesterday;

  @Deprecated(_notExported)
  DateTime get previousWeek =>
      date_time.InternalDateTimeExtension(this).previousWeek;

  @Deprecated(_notExported)
  DateTime get beginningOfTheWeek =>
      date_time.InternalDateTimeExtension(this).beginningOfTheWeek;

  @Deprecated(_notExported)
  DateTime get endOfTheWeek =>
      date_time.InternalDateTimeExtension(this).endOfTheWeek;

  @Deprecated(_notExported)
  DateTime get thisWeekMonday =>
      date_time.InternalDateTimeExtension(this).thisWeekMonday;

  @Deprecated(_notExported)
  DateTime get thisWeekTuesday =>
      date_time.InternalDateTimeExtension(this).thisWeekTuesday;

  @Deprecated(_notExported)
  DateTime get thisWeekWednesday =>
      date_time.InternalDateTimeExtension(this).thisWeekWednesday;

  @Deprecated(_notExported)
  DateTime get thisWeekThursday =>
      date_time.InternalDateTimeExtension(this).thisWeekThursday;

  @Deprecated(_notExported)
  DateTime get thisWeekFriday =>
      date_time.InternalDateTimeExtension(this).thisWeekFriday;

  @Deprecated(_notExported)
  DateTime get thisWeekSaturday =>
      date_time.InternalDateTimeExtension(this).thisWeekSaturday;

  @Deprecated(_notExported)
  DateTime get thisWeekSunday =>
      date_time.InternalDateTimeExtension(this).thisWeekSunday;

  @Deprecated(_notExported)
  String format(String format) =>
      date_time.InternalDateTimeExtension(this).format(format);

  @Deprecated(_notExported)
  DateTime getPreviousMonth() =>
      date_time.InternalDateTimeExtension(this).getPreviousMonth();

  @Deprecated(_notExported)
  DateTime getPreviousYear() =>
      date_time.InternalDateTimeExtension(this).getPreviousYear();

  @Deprecated(_notExported)
  DateTime getNextYear() =>
      date_time.InternalDateTimeExtension(this).getNextYear();

  @Deprecated(_notExported)
  DateTime getNextMonth() =>
      date_time.InternalDateTimeExtension(this).getNextMonth();

  @Deprecated(_notExported)
  bool isSameYear(DateTime date) =>
      date_time.InternalDateTimeExtension(this).isSameYear(date);

  @Deprecated(_notExported)
  bool isSameMonth(DateTime date) =>
      date_time.InternalDateTimeExtension(this).isSameMonth(date);

  @Deprecated(_notExported)
  bool isSameDay(DateTime date) =>
      date_time.InternalDateTimeExtension(this).isSameDay(date);

  @Deprecated(_notExported)
  DateTime dateOnly() => date_time.InternalDateTimeExtension(this).dateOnly();

  @Deprecated(_notExported)
  int getDaysInMonth() =>
      date_time.InternalDateTimeExtension(this).getDaysInMonth();

  @Deprecated(_notExported)
  DateTime setTime(int hour, int minute,
          [int second = 0, int millisecond = 0]) =>
      date_time.InternalDateTimeExtension(this)
          .setTime(hour, minute, second, millisecond);
}

@Deprecated(
    'This function will no longer be exported in 1.0.0. Copy it into your app if you use it.')
int getDayForMonthWithFallback(int year, int month, int day) =>
    date_time.dayForMonthWithFallback(year, month, day);

// EdgeInsetsGeometry

@Deprecated(_notExported)
extension EdgeInsetsGeometryExtension on EdgeInsetsGeometry {
  @Deprecated(_notExported)
  double get start =>
      edge_insets.InternalEdgeInsetsGeometryExtension(this).start;

  @Deprecated(_notExported)
  double get end => edge_insets.InternalEdgeInsetsGeometryExtension(this).end;

  @Deprecated(_notExported)
  double get top => edge_insets.InternalEdgeInsetsGeometryExtension(this).top;

  @Deprecated(_notExported)
  double get bottom =>
      edge_insets.InternalEdgeInsetsGeometryExtension(this).bottom;
}

// TextStyle

@Deprecated(_notExported)
extension TextStyleExtension on TextStyle {
  @Deprecated(
      'Use copyWith(color: color?.withValues(alpha: opacity)) instead. Will be removed in 1.0.0.')
  TextStyle withOpacity(double opacity) =>
      text_style.InternalTextStyleExtension(this).withOpacity(opacity);

  @Deprecated(
      'Use copyWith(fontWeight: FontWeight.w300) instead. Will be removed in 1.0.0.')
  TextStyle get light => text_style.InternalTextStyleExtension(this).light;

  @Deprecated(
      'Use copyWith(fontWeight: FontWeight.w500) instead. Will be removed in 1.0.0.')
  TextStyle get medium => text_style.InternalTextStyleExtension(this).medium;

  @Deprecated(
      'Use copyWith(fontWeight: FontWeight.w600) instead. Will be removed in 1.0.0.')
  TextStyle get semiBold =>
      text_style.InternalTextStyleExtension(this).semiBold;

  @Deprecated(
      'Use copyWith(fontWeight: FontWeight.w700) instead. Will be removed in 1.0.0.')
  TextStyle get bold => text_style.InternalTextStyleExtension(this).bold;
}
