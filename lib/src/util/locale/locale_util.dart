import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';
import 'package:intl/intl.dart';

/// Locale-aware formatting of dates, times and numbers for the components.
///
/// The locale comes from the closest [Localizations] widget (the locale of
/// the app). Formatting only uses the locale when `intl` has data for it
/// (e.g. after `GlobalMaterialLocalizations.delegate` or
/// `initializeDateFormatting()`); otherwise it falls back to the default
/// `intl` locale, which is what the components always used.
///
/// The plain `en` locale (the default locale of `ImpaktfullUiApp`, without a
/// country code) keeps the formats the components always used: `dd/MM/yyyy`
/// and 24-hour time.
class ImpaktfullUiLocaleUtil {
  const ImpaktfullUiLocaleUtil._();

  static const _legacyDatePattern = 'dd/MM/yyyy';

  /// The locale of the closest [Localizations] widget, if any.
  static Locale? localeOf(BuildContext context) =>
      Localizations.maybeLocaleOf(context);

  /// The `intl` locale name for [locale], or null when `intl` has no date
  /// data for it (null makes `intl` use its default locale).
  static String? intlDateLocale(Locale? locale) {
    if (locale == null) return null;
    try {
      return Intl.verifiedLocale(
        locale.toString(),
        _dateLocaleExists,
        onFailure: (_) => null,
      );
    } catch (_) {
      return null;
    }
  }

  /// The `intl` locale name for number formatting, or null to use the
  /// default `intl` locale.
  static String? intlNumberLocale(Locale? locale) {
    if (locale == null) return null;
    try {
      return Intl.verifiedLocale(
        locale.toString(),
        _numberLocaleExists,
        onFailure: (_) => null,
      );
    } catch (_) {
      return null;
    }
  }

  static bool _dateLocaleExists(String locale) {
    try {
      return DateFormat.localeExists(locale);
    } catch (_) {
      return false;
    }
  }

  static bool _numberLocaleExists(String locale) {
    try {
      return NumberFormat.localeExists(locale);
    } catch (_) {
      return false;
    }
  }

  /// Whether [locale] keeps the formats the components used before they were
  /// locale-aware: no locale, or `en` without a country or script code.
  static bool usesLegacyFormats(Locale? locale) {
    if (locale == null) return true;
    return locale.languageCode == 'en' &&
        (locale.countryCode == null || locale.countryCode!.isEmpty) &&
        locale.scriptCode == null;
  }

  static String _format(DateFormat Function(String? locale) builder,
      DateTime date, Locale? locale) {
    final intlLocale = intlDateLocale(locale);
    try {
      return builder(intlLocale).format(date);
    } catch (_) {
      return builder(null).format(date);
    }
  }

  /// Formats [date] with an explicit [pattern] in the current locale.
  static String formatPattern(
    BuildContext context,
    DateTime date,
    String pattern,
  ) =>
      _format((l) => DateFormat(pattern, l), date, localeOf(context));

  /// The short numeric date (`dd/MM/yyyy` for `en`, `DateFormat.yMd`
  /// for every other locale: `7/6/2023` for `en_US`, `6-7-2023` for `nl`).
  static String formatShortDate(BuildContext context, DateTime date) {
    final locale = localeOf(context);
    if (usesLegacyFormats(locale)) {
      return _format((l) => DateFormat(_legacyDatePattern, l), date, locale);
    }
    return _format(DateFormat.yMd, date, locale);
  }

  /// Month and year, e.g. `July 2023` or `juli 2023`.
  static String formatMonthYear(BuildContext context, DateTime date) =>
      _format(DateFormat.yMMMM, date, localeOf(context));

  /// The full name of the month, e.g. `July` or `juillet`.
  static String formatMonth(BuildContext context, DateTime date) =>
      _format(DateFormat.MMMM, date, localeOf(context));

  /// The year, e.g. `2023`.
  static String formatYear(BuildContext context, DateTime date) =>
      _format(DateFormat.y, date, localeOf(context));

  /// The day of the month, e.g. `6`.
  static String formatDay(BuildContext context, DateTime date) =>
      _format(DateFormat.d, date, localeOf(context));

  /// The abbreviated weekday, e.g. `Mon` or `ma`.
  static String formatWeekdayShort(BuildContext context, DateTime date) =>
      _format(DateFormat.E, date, localeOf(context));

  /// Whether times are shown with 24 hours.
  ///
  /// [override] wins, then `MediaQuery.alwaysUse24HourFormat`, then the
  /// locale (the legacy `en` locale uses 24 hours).
  static bool use24HourFormat(BuildContext context, {bool? override}) {
    if (override != null) return override;
    if (MediaQuery.maybeAlwaysUse24HourFormatOf(context) ?? false) return true;
    final locale = localeOf(context);
    if (usesLegacyFormats(locale)) return true;
    final intlLocale = intlDateLocale(locale);
    if (intlLocale == null) return true;
    try {
      final pattern = DateFormat.jm(intlLocale).pattern ?? '';
      return !pattern.contains('a') &&
          !pattern.contains('h') &&
          !pattern.contains('K');
    } catch (_) {
      return true;
    }
  }

  /// The time of [date], e.g. `14:30` or `2:30 PM`.
  static String formatTime(
    BuildContext context,
    DateTime date, {
    bool? use24HourFormat,
  }) {
    final use24 = ImpaktfullUiLocaleUtil.use24HourFormat(context,
        override: use24HourFormat);
    return _format(
        use24 ? DateFormat.Hm : DateFormat.jm, date, localeOf(context));
  }

  /// A full hour, e.g. `14:00` or `2 PM`.
  static String formatHour(
    BuildContext context,
    DateTime date, {
    bool? use24HourFormat,
  }) {
    final use24 = ImpaktfullUiLocaleUtil.use24HourFormat(context,
        override: use24HourFormat);
    return _format(
        use24 ? DateFormat.Hm : DateFormat.j, date, localeOf(context));
  }

  /// The labels for AM and PM in the current locale.
  static List<String> amPmLabels(BuildContext context) {
    final symbols = _dateSymbols(localeOf(context));
    return symbols.AMPMS;
  }

  static DateSymbols _dateSymbols(Locale? locale) {
    final intlLocale = intlDateLocale(locale);
    try {
      return DateFormat('', intlLocale).dateSymbols;
    } catch (_) {
      return DateFormat('').dateSymbols;
    }
  }

  /// The first day of the week, as [DateTime.monday] ... [DateTime.sunday].
  ///
  /// [override] wins. Otherwise it comes from the [MaterialLocalizations] of
  /// the app, when the app registers localized material localizations (e.g.
  /// `GlobalMaterialLocalizations.delegate`, which takes it from the `intl`
  /// date data of the locale). Apps without them (only the English
  /// `DefaultMaterialLocalizations`) keep Monday.
  static int firstDayOfWeek(BuildContext context, {int? override}) {
    if (override != null) {
      assert(
        override >= DateTime.monday && override <= DateTime.sunday,
        'firstDayOfWeek must be DateTime.monday ... DateTime.sunday',
      );
      return override;
    }
    final materialLocalizations =
        Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
    if (materialLocalizations != null &&
        materialLocalizations is! DefaultMaterialLocalizations) {
      final index = materialLocalizations.firstDayOfWeekIndex;
      return index == 0 ? DateTime.sunday : index;
    }
    return DateTime.monday;
  }

  /// The start of the week of [date] for [firstDayOfWeek] (keeps the time of
  /// [date], like `DateTime.beginningOfTheWeek`).
  static DateTime startOfWeek(DateTime date, int firstDayOfWeek) =>
      date.subtract(Duration(days: daysSinceStartOfWeek(date, firstDayOfWeek)));

  /// The amount of days between the start of the week and [date].
  static int daysSinceStartOfWeek(DateTime date, int firstDayOfWeek) =>
      (date.weekday - firstDayOfWeek + 7) % 7;

  /// A percentage, e.g. `50%` or `50 %`. [value] is between 0 and 1.
  static String formatPercentage(BuildContext context, double value) {
    final intlLocale = intlNumberLocale(localeOf(context));
    try {
      return NumberFormat.percentPattern(intlLocale).format(value);
    } catch (_) {
      return '${(value * 100).round()}%';
    }
  }

  /// A decimal number with exactly [fractionDigits] fraction digits,
  /// e.g. `1.50` or `1,50`.
  static String formatDecimal(
    BuildContext context,
    num value, {
    int fractionDigits = 2,
  }) {
    final intlLocale = intlNumberLocale(localeOf(context));
    try {
      final format = NumberFormat.decimalPattern(intlLocale)
        ..minimumFractionDigits = fractionDigits
        ..maximumFractionDigits = fractionDigits;
      format.turnOffGrouping();
      return format.format(value);
    } catch (_) {
      return value.toStringAsFixed(fractionDigits);
    }
  }
}
