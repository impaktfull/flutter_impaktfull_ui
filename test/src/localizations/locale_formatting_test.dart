import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/week/calendar_week_legend_days.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/date_picker_cell.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/date_picker_weekdays.dart';
import 'package:intl/intl.dart';

import '../../util/font_loader.dart';
import '../../util/screen_size_util.dart';

const _supportedLocales = [
  Locale('en'),
  Locale('en', 'US'),
  Locale('en', 'GB'),
  Locale('nl'),
  Locale('fr'),
];

/// Pumps [child] in an app with [locale]. With [globalDelegates] the app
/// registers the localized material localizations (and so the `intl` date
/// data of the locale), like most localized apps do.
Future<void> _pump(
  WidgetTester tester,
  Widget child, {
  required Locale locale,
  bool globalDelegates = true,
}) async {
  await tester.pumpWidget(
    ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      locale: locale,
      supportedLocales: _supportedLocales,
      localizationsDelegates:
          globalDelegates ? GlobalMaterialLocalizations.delegates : null,
      home: ImpaktfullUiContainer(
        color: Colors.transparent,
        child: child,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// The device setting "24-hour time".
Widget _alwaysUse24HourFormat(Widget child) => Builder(
      builder: (context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child,
      ),
    );

List<String> _weekdays(WidgetTester tester) => tester
    .widgetList<Text>(find.descendant(
      of: find.byType(ImpaktfullUiDatePickerWeekdays),
      matching: find.byType(Text),
    ))
    .map((text) => text.data!)
    .toList();

String _firstDayCell(WidgetTester tester) => tester
    .widgetList<ImpaktfullUiDatePickerCell>(
        find.byType(ImpaktfullUiDatePickerCell))
    .first
    .value;

Widget _datePicker({int? firstDayOfWeek}) => ImpaktfullUiDatePicker(
      // Saturday 1 July 2023
      selectedDate: DateTime(2023, 7, 6),
      onDateChanged: (_) {},
      firstDayOfWeek: firstDayOfWeek,
    );

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  group('DatePicker', () {
    testWidgets('en without material localizations: unchanged', (tester) async {
      await _pump(tester, _datePicker(),
          locale: const Locale('en'), globalDelegates: false);
      expect(find.text('July 2023'), findsOneWidget);
      expect(
          _weekdays(tester), ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']);
      expect(_firstDayCell(tester), '26');
    });

    testWidgets(
        'en with material localizations: week starts on Sunday (the first '
        'day of the week of the locale)', (tester) async {
      await _pump(tester, _datePicker(), locale: const Locale('en'));
      expect(find.text('July 2023'), findsOneWidget);
      expect(_weekdays(tester).first, 'Sun');
      expect(_firstDayCell(tester), '25');
    });

    testWidgets('nl: Dutch names, week starts on Monday', (tester) async {
      await _pump(tester, _datePicker(), locale: const Locale('nl'));
      expect(find.text('juli 2023'), findsOneWidget);
      expect(_weekdays(tester), ['ma', 'di', 'wo', 'do', 'vr', 'za', 'zo']);
      expect(_firstDayCell(tester), '26');
    });

    testWidgets('fr: French names, week starts on Monday', (tester) async {
      await _pump(tester, _datePicker(), locale: const Locale('fr'));
      expect(find.text('juillet 2023'), findsOneWidget);
      expect(_weekdays(tester).first, 'lun.');
      expect(_weekdays(tester).last, 'dim.');
      expect(_firstDayCell(tester), '26');
    });

    testWidgets('en_US: week starts on Sunday', (tester) async {
      await _pump(tester, _datePicker(), locale: const Locale('en', 'US'));
      expect(find.text('July 2023'), findsOneWidget);
      expect(
          _weekdays(tester), ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']);
      // July 2023 starts on a Saturday: Sunday 25 June is the first cell.
      expect(_firstDayCell(tester), '25');
    });

    testWidgets('en_GB: week starts on Monday', (tester) async {
      await _pump(tester, _datePicker(), locale: const Locale('en', 'GB'));
      expect(_weekdays(tester).first, 'Mon');
      expect(_firstDayCell(tester), '26');
    });

    testWidgets('firstDayOfWeek overrides the locale', (tester) async {
      await _pump(tester, _datePicker(firstDayOfWeek: DateTime.saturday),
          locale: const Locale('nl'));
      expect(_weekdays(tester).first, 'za');
      // July 2023 starts on a Saturday: no days of June.
      expect(_firstDayCell(tester), '1');
    });

    testWidgets('months and years use the locale', (tester) async {
      await _pump(tester, _datePicker(), locale: const Locale('fr'));
      await tester.tap(find.text('juillet 2023'));
      await tester.pumpAndSettle();
      expect(find.text('juillet'), findsOneWidget);
      expect(find.text('janvier'), findsOneWidget);
    });
  });

  group('Calendar', () {
    final event = ImpaktfullUiCalendarEvent(
      title: 'Meeting',
      startDate: DateTime(2099, 1, 2, 14, 30),
      endDate: DateTime(2099, 1, 2, 15, 30),
    );

    Widget calendarList() => ImpaktfullUiCalendar(
          type: ImpaktfullUiCalendarType.list,
          selectedDate: DateTime(2099, 1, 2),
          events: [event],
          onEventTap: (_) {},
        );

    testWidgets('en: 24 hour time and dd/MM/yyyy, unchanged', (tester) async {
      await _pump(tester, calendarList(), locale: const Locale('en'));
      expect(find.text('02/01/2099'), findsOneWidget);
      expect(find.text('14:30 - 15:30'), findsOneWidget);
    });

    testWidgets('nl: 24 hour time and the Dutch short date', (tester) async {
      await _pump(tester, calendarList(), locale: const Locale('nl'));
      expect(find.text('2-1-2099'), findsOneWidget);
      expect(find.text('14:30 - 15:30'), findsOneWidget);
    });

    testWidgets('en_US: 12 hour time and M/d/y', (tester) async {
      await _pump(tester, calendarList(), locale: const Locale('en', 'US'));
      final time = DateFormat.jm('en_US');
      expect(find.text('1/2/2099'), findsOneWidget);
      expect(
        find.text(
            '${time.format(event.startDate)} - ${time.format(event.endDate)}'),
        findsOneWidget,
      );
    });

    testWidgets('alwaysUse24HourFormat wins over the locale', (tester) async {
      await _pump(tester, _alwaysUse24HourFormat(calendarList()),
          locale: const Locale('en', 'US'));
      expect(find.text('14:30 - 15:30'), findsOneWidget);
    });

    testWidgets('use24HourFormat wins over everything', (tester) async {
      await _pump(
        tester,
        ImpaktfullUiCalendar(
          type: ImpaktfullUiCalendarType.list,
          selectedDate: DateTime(2099, 1, 2),
          events: [event],
          onEventTap: (_) {},
          use24HourFormat: false,
        ),
        // The plain en locale uses 24 hours by default.
        locale: const Locale('en'),
      );
      final time = DateFormat.jm('en');
      expect(time.format(event.startDate), contains('PM'));
      expect(
        find.text(
            '${time.format(event.startDate)} - ${time.format(event.endDate)}'),
        findsOneWidget,
      );
    });

    Future<DateTime> weekStart(WidgetTester tester, Locale locale,
        {bool globalDelegates = true, int? firstDayOfWeek}) async {
      setScreenSize(tester, const Size(1400, 1000));
      await _pump(
        tester,
        ImpaktfullUiCalendar(
          type: ImpaktfullUiCalendarType.week,
          // Wednesday
          selectedDate: DateTime(2024, 5, 15),
          events: const [],
          onEventTap: (_) {},
          firstDayOfWeek: firstDayOfWeek,
        ),
        locale: locale,
        globalDelegates: globalDelegates,
      );
      return tester
          .widget<ImpaktfullUiCalendarWeekLegendDays>(
              find.byType(ImpaktfullUiCalendarWeekLegendDays))
          .firstDay;
    }

    testWidgets('week starts on Monday without material localizations',
        (tester) async {
      final start =
          await weekStart(tester, const Locale('en'), globalDelegates: false);
      expect(start.weekday, DateTime.monday);
      expect(start.day, 13);
    });

    testWidgets('week starts on Monday for nl', (tester) async {
      final start = await weekStart(tester, const Locale('nl'));
      expect(start.weekday, DateTime.monday);
      expect(start.day, 13);
    });

    testWidgets('week starts on Sunday for en_US', (tester) async {
      final start = await weekStart(tester, const Locale('en', 'US'));
      expect(start.weekday, DateTime.sunday);
      expect(start.day, 12);
    });

    testWidgets('firstDayOfWeek overrides the locale', (tester) async {
      final start = await weekStart(tester, const Locale('en', 'US'),
          firstDayOfWeek: DateTime.monday);
      expect(start.weekday, DateTime.monday);
    });

    testWidgets('hours legend follows the time format', (tester) async {
      setScreenSize(tester, const Size(1400, 1000));
      await _pump(
        tester,
        ImpaktfullUiCalendar(
          type: ImpaktfullUiCalendarType.week,
          selectedDate: DateTime(2024, 5, 15),
          events: const [],
          onEventTap: (_) {},
        ),
        locale: const Locale('en'),
      );
      expect(find.text('01:00'), findsOneWidget);
      expect(find.text('23:00'), findsOneWidget);
    });
  });

  group('DateInputField', () {
    Widget dateInputField({String? dateFormat}) => ImpaktfullUiDateInputField(
          date: DateTime(2023, 7, 6),
          onDateSelected: (_) {},
          dateFormat: dateFormat,
        );

    for (final (locale, expected) in const [
      (Locale('en'), '06/07/2023'),
      (Locale('en', 'US'), '7/6/2023'),
      (Locale('en', 'GB'), '06/07/2023'),
      (Locale('nl'), '6-7-2023'),
      (Locale('fr'), '06/07/2023'),
    ]) {
      testWidgets('default format for $locale', (tester) async {
        await _pump(tester, dateInputField(), locale: locale);
        expect(find.text(expected), findsOneWidget);
      });
    }

    testWidgets('en without material localizations keeps dd/MM/yyyy',
        (tester) async {
      await _pump(tester, dateInputField(),
          locale: const Locale('en'), globalDelegates: false);
      expect(find.text('06/07/2023'), findsOneWidget);
    });

    testWidgets('a custom pattern uses the names of the locale',
        (tester) async {
      await _pump(tester, dateInputField(dateFormat: 'd MMMM y'),
          locale: const Locale('nl'));
      expect(find.text('6 juli 2023'), findsOneWidget);
    });

    test('dateFormat keeps returning a pattern', () {
      expect(
        ImpaktfullUiDateInputField(date: null, onDateSelected: (_) {})
            .dateFormat,
        'dd/MM/yyyy',
      );
      expect(
        ImpaktfullUiDateInputField(
          date: null,
          onDateSelected: (_) {},
          dateFormat: 'yyyy-MM-dd',
        ).dateFormat,
        'yyyy-MM-dd',
      );
    });
  });

  group('TimePicker', () {
    String fieldText(WidgetTester tester, Finder finder) =>
        tester.widget<EditableText>(finder).controller.text;
    final hoursField = find.byType(EditableText).first;

    testWidgets('en: 24 hours, unchanged', (tester) async {
      await _pump(
        tester,
        ImpaktfullUiTimePicker(
          value: const TimeOfDay(hour: 14, minute: 30),
          onChanged: (_) {},
        ),
        locale: const Locale('en'),
      );
      expect(fieldText(tester, hoursField), '14');
      expect(find.text('PM'), findsNothing);
    });

    testWidgets('en_US: 12 hours with an AM/PM toggle', (tester) async {
      final values = <TimeOfDay>[];
      await _pump(
        tester,
        ImpaktfullUiTimePicker(
          value: const TimeOfDay(hour: 14, minute: 30),
          onChanged: values.add,
        ),
        locale: const Locale('en', 'US'),
      );
      expect(fieldText(tester, hoursField), '2');
      expect(find.text('PM'), findsOneWidget);

      await tester.enterText(hoursField, '11');
      await tester.pumpAndSettle();
      expect(values.last, const TimeOfDay(hour: 23, minute: 30));

      await tester.tap(find.text('PM'));
      await tester.pumpAndSettle();
      expect(values.last, const TimeOfDay(hour: 11, minute: 30));
      expect(find.text('AM'), findsOneWidget);

      await tester.enterText(hoursField, '12');
      await tester.pumpAndSettle();
      expect(values.last, const TimeOfDay(hour: 0, minute: 30));
    });

    testWidgets('alwaysUse24HourFormat wins over the locale', (tester) async {
      await _pump(
        tester,
        _alwaysUse24HourFormat(ImpaktfullUiTimePicker(
          value: const TimeOfDay(hour: 14, minute: 30),
          onChanged: (_) {},
        )),
        locale: const Locale('en', 'US'),
      );
      expect(fieldText(tester, hoursField), '14');
    });

    testWidgets('use24HourFormat: false shows 12 hours for any locale',
        (tester) async {
      await _pump(
        tester,
        ImpaktfullUiTimePicker(
          value: const TimeOfDay(hour: 0, minute: 5),
          onChanged: (_) {},
          use24HourFormat: false,
        ),
        locale: const Locale('en'),
      );
      expect(fieldText(tester, hoursField), '12');
      expect(find.text('AM'), findsOneWidget);
    });
  });

  group('Numbers', () {
    testWidgets('percentages use the locale', (tester) async {
      for (final locale in const [Locale('en'), Locale('fr')]) {
        await _pump(
          tester,
          const ImpaktfullUiProgressIndicator(value: 0.5, showText: true),
          locale: locale,
        );
        expect(
          find.text(NumberFormat.percentPattern(locale.toString()).format(0.5)),
          findsOneWidget,
        );
      }
      expect(NumberFormat.percentPattern('en').format(0.5), '50%');
    });
  });

  group('Chat', () {
    testWidgets('date label uses the short date of the locale', (tester) async {
      Widget chat() => ImpaktfullUiChat(
            items: [
              ImpaktfullUiChatItem(
                senderId: 'other',
                message: 'Hello',
                timestamp: DateTime(2024, 1, 2, 12),
              ),
            ],
            senderConfig: const ImpaktfullUiChatSenderConfig.oneToOne(
              me: ImpaktfullUiChatSender(id: 'me'),
              other: ImpaktfullUiChatSender(id: 'other'),
            ),
          );
      await _pump(tester, chat(), locale: const Locale('en'));
      expect(find.text('02/01/2024'), findsOneWidget);
      await _pump(tester, chat(), locale: const Locale('nl'));
      expect(find.text('2-1-2024'), findsOneWidget);
      await _pump(tester, chat(), locale: const Locale('en', 'US'));
      expect(find.text('1/2/2024'), findsOneWidget);
    });
  });
}
