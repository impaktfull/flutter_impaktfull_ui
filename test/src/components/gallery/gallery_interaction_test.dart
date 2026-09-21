import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';
import '../../../util/test_util.dart';

ImpaktfullUiGalleryItem _item(String title, Color color) =>
    ImpaktfullUiGalleryItem(
      id: title,
      title: title,
      child: ColoredBox(
        color: color,
        child: const SizedBox(width: 50, height: 50),
      ),
    );

final _items = [
  _item('Red', Colors.red),
  _item('Green', Colors.green),
  _item('Blue', Colors.blue),
];

Finder get _fullScreen => find.byType(ImpaktfullUiGalleryFullScreen);

/// The title of the page that is shown in the full screen.
String? _currentTitle(WidgetTester tester) {
  final pageView = tester.widget<PageView>(
    find.descendant(of: _fullScreen, matching: find.byType(PageView)),
  );
  final page = pageView.controller!.page!.round();
  return _items[page].title;
}

Future<void> _pumpGallery(WidgetTester tester) => pumpAndSettleComponent(
      tester,
      ImpaktfullUiGallery(
        items: _items,
        noDataLabel: 'No items',
        crossAxisCount: (context, config) => 3,
      ),
    );

Future<void> _openFullScreen(WidgetTester tester, int index) async {
  await tester.tap(find.byWidget(_items[index].child()).first);
  await tester.pumpAndSettle();
  expect(_fullScreen, findsOneWidget);
}

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  testWidgets('shows every item in the grid', (tester) async {
    await _pumpGallery(tester);
    for (final item in _items) {
      expect(find.byWidget(item.child()), findsOneWidget);
    }
  });

  testWidgets('the default grid has a column per 250 pixels', (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: SizedBox(
          width: 800,
          child: ImpaktfullUiGallery(items: _items, noDataLabel: 'No items'),
        ),
      ),
    );
    final top = _items
        .map((item) => tester.getTopLeft(find.byWidget(item.child())).dy)
        .toSet();
    // 800 / 250 = 3 columns: all items on one row.
    expect(top, hasLength(1));
  });

  group(
    'itemBorderRadius',
    () {
      testWidgets('clips the item with the border radius', (tester) async {
        await pumpAndSettleComponent(
          tester,
          ImpaktfullUiGallery(
            items: _items,
            noDataLabel: 'No items',
            itemBorderRadius: BorderRadius.circular(24),
          ),
        );
        final clips = find.ancestor(
          of: find.byWidget(_items.first.child()),
          matching: find.byWidgetPredicate(
            (widget) =>
                (widget is ClipRRect &&
                    widget.borderRadius == BorderRadius.circular(24)) ||
                (widget is Material &&
                    widget.clipBehavior != Clip.none &&
                    widget.borderRadius == BorderRadius.circular(24)),
          ),
        );
        expect(clips, findsWidgets);
      });
    },
  );

  testWidgets('tapping an item opens the full screen at that item',
      (tester) async {
    await _pumpGallery(tester);
    await _openFullScreen(tester, 1);
    expect(_currentTitle(tester), 'Green');
  });

  group('Full screen', () {
    testWidgets('next and previous buttons change the page', (tester) async {
      await _pumpGallery(tester);
      await _openFullScreen(tester, 1);

      await tester.tap(find.byTooltip('Next'));
      await tester.pumpAndSettle();
      expect(_currentTitle(tester), 'Blue');
      // The last item has no next button.
      expect(find.byTooltip('Next'), findsNothing);

      await tester.tap(find.byTooltip('Previous'));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Previous'));
      await tester.pumpAndSettle();
      expect(_currentTitle(tester), 'Red');
      // The first item has no previous button.
      expect(find.byTooltip('Previous'), findsNothing);
    });

    testWidgets('the arrow keys change the page', (tester) async {
      await _pumpGallery(tester);
      await _openFullScreen(tester, 0);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
      expect(_currentTitle(tester), 'Green');

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
      expect(_currentTitle(tester), 'Blue');

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle();
      expect(_currentTitle(tester), 'Green');
    });

    testWidgets('arrow left on the first item stays on the first item',
        (tester) async {
      await _pumpGallery(tester);
      await _openFullScreen(tester, 0);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle();
      expect(_currentTitle(tester), 'Red');
    });

    testWidgets('swiping changes the page', (tester) async {
      await _pumpGallery(tester);
      await _openFullScreen(tester, 0);

      await tester.fling(
        find.descendant(of: _fullScreen, matching: find.byType(PageView)),
        const Offset(-400, 0),
        1000,
      );
      await tester.pumpAndSettle();
      expect(_currentTitle(tester), 'Green');
      expect(find.byTooltip('Previous'), findsOneWidget);
    });

    testWidgets('the close button closes the full screen', (tester) async {
      await _pumpGallery(tester);
      await _openFullScreen(tester, 0);

      await tester.tap(find.byTooltip('Close fullscreen'));
      await tester.pumpAndSettle();
      expect(_fullScreen, findsNothing);
    });

    testWidgets('a tap next to the image closes the full screen',
        (tester) async {
      await _pumpGallery(tester);
      await _openFullScreen(tester, 0);

      await tester.tapAt(const Offset(100, 300));
      await tester.pumpAndSettle();
      expect(_fullScreen, findsNothing);
    });

    testWidgets('a tap on the image keeps the full screen open',
        (tester) async {
      await _pumpGallery(tester);
      await _openFullScreen(tester, 0);

      await tester.tap(
        find
            .descendant(
              of: _fullScreen,
              matching: find.byWidget(_items[0].child()),
            )
            .first,
      );
      // Wait for the double tap timeout.
      await tester.pumpAndSettle(const Duration(milliseconds: 400));
      expect(_fullScreen, findsOneWidget);
    });

    testWidgets('shows the title of the item', (tester) async {
      await _pumpGallery(tester);
      await _openFullScreen(tester, 2);
      expect(
        find.descendant(of: _fullScreen, matching: find.text('Blue')),
        findsOneWidget,
      );
    });
  });
}
