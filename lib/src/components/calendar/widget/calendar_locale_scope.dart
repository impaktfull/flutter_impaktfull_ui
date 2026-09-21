import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.localizations.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

/// Passes the localizations and time format of a calendar to its internal
/// widgets.
class ImpaktfullUiCalendarLocaleScope extends InheritedWidget {
  final ImpaktfullUiCalendarLocalizations? localizations;
  final bool? use24HourFormat;

  const ImpaktfullUiCalendarLocaleScope({
    required this.localizations,
    required this.use24HourFormat,
    required super.child,
    super.key,
  });

  static ImpaktfullUiCalendarLocaleScope? _maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<
          ImpaktfullUiCalendarLocaleScope>();

  static ImpaktfullUiCalendarLocalizations localizationsOf(
          BuildContext context) =>
      _maybeOf(context)?.localizations ??
      ImpaktfullUiLocalizations.of<ImpaktfullUiCalendarLocalizations>(context);

  static bool? use24HourFormatOf(BuildContext context) =>
      _maybeOf(context)?.use24HourFormat;

  @override
  bool updateShouldNotify(ImpaktfullUiCalendarLocaleScope oldWidget) =>
      localizations != oldWidget.localizations ||
      use24HourFormat != oldWidget.use24HourFormat;
}
