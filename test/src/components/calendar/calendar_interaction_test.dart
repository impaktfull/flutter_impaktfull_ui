import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/week/calendar_week_event_item.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/week/calendar_week_legend_days.dart';

import '../../../util/font_loader.dart';
import '../../../util/test_util.dart';
import '../_overlays_test_helpers.dart';

/// The first day of the week that is shown in the week view.
DateTime _firstDayShown(WidgetTester tester) => tester
    .widget<ImpaktfullUiCalendarWeekLegendDays>(
      find.byType(ImpaktfullUiCalendarWeekLegendDays),
    )
    .firstDay;

final _standup = ImpaktfullUiCalendarEvent(
  title: 'Standup',
  startDate: DateTime(2024, 5, 15, 9),
  endDate: DateTime(2024, 5, 15, 10),
);

final _nextWeek = ImpaktfullUiCalendarEvent(
  title: 'Next week',
  startDate: DateTime(2024, 5, 21, 9),
  endDate: DateTime(2024, 5, 21, 10),
);

Future<List<ImpaktfullUiCalendarEvent>> _pumpCalendar(
  WidgetTester tester, {
  required ImpaktfullUiCalendarType type,
  required DateTime selectedDate,
  required List<ImpaktfullUiCalendarEvent> events,
}) async {
  setOverlayTestViewSize(tester, const Size(1400, 1000));
  final taps = <ImpaktfullUiCalendarEvent>[];
  await pumpAndSettleComponent(
    tester,
    ImpaktfullUiCalendar(
      type: type,
      selectedDate: selectedDate,
      events: events,
      onEventTap: taps.add,
    ),
  );
  return taps;
}

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  group('Week', () {
    Future<List<ImpaktfullUiCalendarEvent>> pumpWeek(WidgetTester tester) =>
        _pumpCalendar(
          tester,
          type: ImpaktfullUiCalendarType.week,
          selectedDate: DateTime(2024, 5, 15),
          events: [_standup, _nextWeek],
        );

    testWidgets('shows the week of the selected date', (tester) async {
      await pumpWeek(tester);
      expect(_firstDayShown(tester), DateTime(2024, 5, 13));
      expect(find.text('Standup'), findsOneWidget);
      expect(find.text('Next week'), findsNothing);
    });

    testWidgets('the next and previous buttons page per week', (tester) async {
      await pumpWeek(tester);

      await tapAndSettle(tester, find.byType(ImpaktfullUiIconButton).last);
      expect(_firstDayShown(tester), DateTime(2024, 5, 20));
      expect(find.text('Next week'), findsOneWidget);
      expect(find.text('Standup'), findsNothing);

      await tapAndSettle(tester, find.byType(ImpaktfullUiIconButton).first);
      await tapAndSettle(tester, find.byType(ImpaktfullUiIconButton).first);
      expect(_firstDayShown(tester), DateTime(2024, 5, 6));
    });

    testWidgets('Today shows the week of today', (tester) async {
      await pumpWeek(tester);

      await tapAndSettle(tester, find.text('Today'));
      final firstDay = _firstDayShown(tester);
      final today = DateTime.now();
      expect(firstDay.weekday, DateTime.monday);
      expect(firstDay.isSameDay(today.beginningOfTheWeek), isTrue);
    });

    testWidgets('tapping an event calls onEventTap', (tester) async {
      final taps = await pumpWeek(tester);

      await tapAndSettle(tester, find.text('Standup'));
      expect(taps, [_standup]);
    });

    testWidgets('scrolls to the morning when it is shown', (tester) async {
      await pumpWeek(tester);

      final scrollable = tester.state<ScrollableState>(
        find.byType(Scrollable).last,
      );
      final hourHeight = ImpaktfullUiCalendarTheme.of(
        tester.element(find.byType(ImpaktfullUiCalendarWeek)),
      ).dimens.weekHourHeight;
      expect(scrollable.position.pixels, closeTo(7.75 * hourHeight, 1));
    });

    testWidgets('a new selected date of the parent shows its week',
        (tester) async {
      var selectedDate = DateTime(2024, 5, 15);
      late StateSetter setState;
      setOverlayTestViewSize(tester, const Size(1400, 1000));
      await pumpAndSettleComponent(
        tester,
        StatefulBuilder(
          builder: (context, setter) {
            setState = setter;
            return ImpaktfullUiCalendar(
              type: ImpaktfullUiCalendarType.week,
              selectedDate: selectedDate,
              events: [_standup, _nextWeek],
              onEventTap: (_) {},
            );
          },
        ),
      );

      setState(() => selectedDate = DateTime(2024, 5, 23));
      await tester.pumpAndSettle();
      expect(_firstDayShown(tester), DateTime(2024, 5, 20));
      expect(find.text('Next week'), findsOneWidget);
    });

    testWidgets('new events of the parent are shown', (tester) async {
      var events = [_standup];
      late StateSetter setState;
      setOverlayTestViewSize(tester, const Size(1400, 1000));
      await pumpAndSettleComponent(
        tester,
        StatefulBuilder(
          builder: (context, setter) {
            setState = setter;
            return ImpaktfullUiCalendar(
              type: ImpaktfullUiCalendarType.week,
              selectedDate: DateTime(2024, 5, 15),
              events: events,
              onEventTap: (_) {},
            );
          },
        ),
      );

      final lunch = ImpaktfullUiCalendarEvent(
        title: 'Lunch',
        startDate: DateTime(2024, 5, 14, 12),
        endDate: DateTime(2024, 5, 14, 13),
      );
      setState(() => events = [_standup, lunch]);
      await tester.pumpAndSettle();
      expect(find.text('Lunch'), findsOneWidget);
    });

    group(
      'partially overlapping events',
      () {
        testWidgets('are not drawn on top of each other', (tester) async {
          await _pumpCalendar(
            tester,
            type: ImpaktfullUiCalendarType.week,
            selectedDate: DateTime(2024, 5, 15),
            events: [
              ImpaktfullUiCalendarEvent(
                title: 'Lunch',
                startDate: DateTime(2024, 5, 15, 12),
                endDate: DateTime(2024, 5, 15, 13),
              ),
              ImpaktfullUiCalendarEvent(
                title: 'Overlap',
                startDate: DateTime(2024, 5, 15, 12, 30),
                endDate: DateTime(2024, 5, 15, 14),
              ),
            ],
          );
          Rect rect(String title) => tester.getRect(
                find.byWidgetPredicate(
                  (widget) =>
                      widget is ImpaktfullUiCalendarWeekEventItem &&
                      widget.event.title == title,
                ),
              );
          final overlap = rect('Lunch').intersect(rect('Overlap'));
          expect(overlap.width <= 0 || overlap.height <= 0, isTrue);
        });
      },
    );
  });

  group('List', () {
    final future = ImpaktfullUiCalendarEvent(
      title: 'Future',
      startDate: DateTime(2099, 3, 2, 9),
      endDate: DateTime(2099, 3, 2, 10),
    );
    final past = ImpaktfullUiCalendarEvent(
      title: 'Past',
      startDate: DateTime(2020, 3, 2, 9),
      endDate: DateTime(2020, 3, 2, 10),
    );

    testWidgets('only shows the events that did not end yet', (tester) async {
      await _pumpCalendar(
        tester,
        type: ImpaktfullUiCalendarType.list,
        selectedDate: DateTime(2099, 3, 2),
        events: [past, future],
      );
      expect(find.text('Future'), findsOneWidget);
      expect(find.text('Past'), findsNothing);
    });

    testWidgets('shows a placeholder without events', (tester) async {
      await _pumpCalendar(
        tester,
        type: ImpaktfullUiCalendarType.list,
        selectedDate: DateTime(2099, 3, 2),
        events: [past],
      );
      expect(find.text('No events found'), findsOneWidget);
    });

    testWidgets('an event of multiple days is shown for every day',
        (tester) async {
      await _pumpCalendar(
        tester,
        type: ImpaktfullUiCalendarType.list,
        selectedDate: DateTime(2099, 3, 2),
        events: [
          ImpaktfullUiCalendarEvent(
            title: 'Trip',
            startDate: DateTime(2099, 3, 3),
            endDate: DateTime(2099, 3, 5, 23, 59, 59),
          ),
        ],
      );
      expect(find.text('Trip'), findsNWidgets(3));
      expect(find.text('(1/3 days) All day'), findsOneWidget);
      expect(find.text('(3/3 days) All day'), findsOneWidget);
    });

    testWidgets('sorts the events by date', (tester) async {
      final later = ImpaktfullUiCalendarEvent(
        title: 'Later',
        startDate: DateTime(2099, 3, 5, 9),
        endDate: DateTime(2099, 3, 5, 10),
      );
      await _pumpCalendar(
        tester,
        type: ImpaktfullUiCalendarType.list,
        selectedDate: DateTime(2099, 3, 2),
        events: [later, future],
      );
      expect(
        tester.getTopLeft(find.text('Future')).dy,
        lessThan(tester.getTopLeft(find.text('Later')).dy),
      );
    });

    testWidgets('tapping an event calls onEventTap', (tester) async {
      final taps = await _pumpCalendar(
        tester,
        type: ImpaktfullUiCalendarType.list,
        selectedDate: DateTime(2099, 3, 2),
        events: [future],
      );

      await tapAndSettle(tester, find.text('Future'));
      expect(taps, [future]);
    });
  });

  group('ImpaktfullUiCalendarEvent.amountOfDaysCovered', () {
    test('an event on one day covers 1 day', () {
      final event = ImpaktfullUiCalendarEvent(
        title: 'Event',
        startDate: DateTime(2024, 5, 15, 9),
        endDate: DateTime(2024, 5, 15, 17),
      );
      expect(event.amountOfDaysCovered, 1);
    });

    test('an event until the next morning covers 2 days', () {
      final event = ImpaktfullUiCalendarEvent(
        title: 'Event',
        startDate: DateTime(2024, 5, 15, 22),
        endDate: DateTime(2024, 5, 16, 2),
      );
      expect(event.amountOfDaysCovered, 2);
    });

    test('a full day event of 3 days covers 3 days', () {
      final event = ImpaktfullUiCalendarEvent(
        title: 'Event',
        startDate: DateTime(2024, 5, 15),
        endDate: DateTime(2024, 5, 17, 23, 59, 59),
      );
      expect(event.amountOfDaysCovered, 3);
    });

    group(
      'end time earlier than the start time',
      () {
        test('an event from the evening until 2 days later covers 3 days', () {
          final event = ImpaktfullUiCalendarEvent(
            title: 'Event',
            startDate: DateTime(2024, 5, 15, 20),
            endDate: DateTime(2024, 5, 17, 9),
          );
          expect(event.amountOfDaysCovered, 3);
        });
      },
    );
  });
}
