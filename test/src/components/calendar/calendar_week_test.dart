import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/week/calendar_week_event_item.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/week/calendar_week_full_day_events.dart';

import '../../../util/font_loader.dart';
import '../../../util/test_util.dart';

// Wednesday, the week starts on Monday 13 May 2024.
final _selectedDate = DateTime(2024, 5, 15);

Future<void> _pumpCalendar(
  WidgetTester tester,
  List<ImpaktfullUiCalendarEvent> events,
) async {
  tester.view.physicalSize = const Size(1400, 1000);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await pumpAndSettleComponent(
    tester,
    ImpaktfullUiCalendar(
      type: ImpaktfullUiCalendarType.week,
      selectedDate: _selectedDate,
      events: events,
      onEventTapped: (event) {},
    ),
  );
}

Rect _eventRect(WidgetTester tester, String title) => tester.getRect(
      find.byWidgetPredicate(
        (widget) =>
            widget is ImpaktfullUiCalendarWeekEventItem &&
            widget.event.title == title,
      ),
    );

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  group('Events list', () {
    testWidgets('does not sort the list of the app', (tester) async {
      final late = ImpaktfullUiCalendarEvent(
        title: 'Late',
        startDate: DateTime(2024, 5, 15, 14),
        endDate: DateTime(2024, 5, 15, 15),
      );
      final early = ImpaktfullUiCalendarEvent(
        title: 'Early',
        startDate: DateTime(2024, 5, 15, 9),
        endDate: DateTime(2024, 5, 15, 10),
      );
      final events = [late, early];
      await _pumpCalendar(tester, events);
      expect(events, [late, early]);
    });

    testWidgets('supports an unmodifiable list', (tester) async {
      await _pumpCalendar(
        tester,
        List.unmodifiable([
          ImpaktfullUiCalendarEvent(
            title: 'Late',
            startDate: DateTime(2024, 5, 15, 14),
            endDate: DateTime(2024, 5, 15, 15),
          ),
          ImpaktfullUiCalendarEvent(
            title: 'Early',
            startDate: DateTime(2024, 5, 15, 9),
            endDate: DateTime(2024, 5, 15, 10),
          ),
        ]),
      );
      expect(tester.takeException(), isNull);
      expect(find.text('Early'), findsOneWidget);
    });
  });

  testWidgets('overlapping events are positioned relative to the day width',
      (tester) async {
    await _pumpCalendar(tester, [
      ImpaktfullUiCalendarEvent(
        title: 'First',
        startDate: DateTime(2024, 5, 15, 10),
        endDate: DateTime(2024, 5, 15, 11),
      ),
      ImpaktfullUiCalendarEvent(
        title: 'Second',
        startDate: DateTime(2024, 5, 15, 10),
        endDate: DateTime(2024, 5, 15, 11),
      ),
    ]);

    final dayColumn = tester.getRect(
      find
          .ancestor(
            of: find.byWidgetPredicate(
              (widget) =>
                  widget is ImpaktfullUiCalendarWeekEventItem &&
                  widget.event.title == 'Second',
            ),
            matching: find.byType(Stack),
          )
          .first,
    );
    expect(dayColumn.width, isNot(closeTo(100, 1)));
    final second = _eventRect(tester, 'Second');
    // Half of the column + 2px padding
    expect(second.left, closeTo(dayColumn.left + dayColumn.width / 2 + 2, 1));
    expect(second.right, closeTo(dayColumn.right - 2, 1));
  });

  group('Full day events', () {
    Rect header(WidgetTester tester) =>
        tester.getRect(find.byType(ImpaktfullUiCalendarWeekFullDayEvents));

    testWidgets('an event that started last week starts in the first column',
        (tester) async {
      await _pumpCalendar(tester, [
        ImpaktfullUiCalendarEvent(
          title: 'Holiday',
          // Sunday of the previous week until Tuesday
          startDate: DateTime(2024, 5, 12),
          endDate: DateTime(2024, 5, 14, 23, 59, 59),
        ),
      ]);
      expect(tester.takeException(), isNull);

      final dayWidth = header(tester).width / 7;
      final event = _eventRect(tester, 'Holiday');
      expect(event.left, closeTo(header(tester).left + 2, 1));
      // Monday & Tuesday
      expect(event.width, closeTo(dayWidth * 2 - 4, 1));
    });

    testWidgets('an event that continues next week stops at the last column',
        (tester) async {
      await _pumpCalendar(tester, [
        ImpaktfullUiCalendarEvent(
          title: 'Holiday',
          // Saturday until Tuesday of next week
          startDate: DateTime(2024, 5, 18),
          endDate: DateTime(2024, 5, 21, 23, 59, 59),
        ),
      ]);
      expect(tester.takeException(), isNull);

      final dayWidth = header(tester).width / 7;
      final event = _eventRect(tester, 'Holiday');
      expect(event.left, closeTo(header(tester).left + dayWidth * 5 + 2, 1));
      expect(event.right, closeTo(header(tester).right - 2, 1));
    });

    testWidgets('events of other weeks do not push events down',
        (tester) async {
      await _pumpCalendar(tester, [
        ImpaktfullUiCalendarEvent(
          title: 'This week',
          startDate: DateTime(2024, 5, 15),
          endDate: DateTime(2024, 5, 15, 23, 59, 59),
        ),
        ImpaktfullUiCalendarEvent(
          title: 'Other week',
          // Monday until Thursday, 2 weeks later
          startDate: DateTime(2024, 5, 27),
          endDate: DateTime(2024, 5, 30, 23, 59, 59),
        ),
      ]);

      final event = _eventRect(tester, 'This week');
      expect(event.top, closeTo(header(tester).top, 1));
    });
  });
}
