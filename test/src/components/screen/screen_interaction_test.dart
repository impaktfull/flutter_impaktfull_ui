import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_layout_test_helpers.dart';

void main() {
  testWidgets('has no nav bar without title, subtitle, back or actions',
      (tester) async {
    await pumpLayoutApp(tester, const ImpaktfullUiScreen(child: Text('body')));
    expect(find.byType(ImpaktfullUiNavBar), findsNothing);
    expect(find.text('body'), findsOneWidget);
  });

  testWidgets('shows a nav bar with title and subtitle', (tester) async {
    await pumpLayoutApp(
      tester,
      const ImpaktfullUiScreen(
        title: 'Title',
        subtitle: 'Subtitle',
        child: Text('body'),
      ),
    );
    expect(find.byType(ImpaktfullUiNavBar), findsOneWidget);
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Subtitle'), findsOneWidget);
    // The body is below the nav bar.
    expect(
      tester.getTopLeft(find.text('body')).dy,
      greaterThanOrEqualTo(
          tester.getBottomLeft(find.byType(ImpaktfullUiNavBar)).dy),
    );
  });

  testWidgets('tapping back calls onBackTapped', (tester) async {
    var taps = 0;
    await pumpLayoutApp(
      tester,
      ImpaktfullUiScreen(
        title: 'Title',
        onBackTapped: () => taps++,
        child: const SizedBox(),
      ),
    );
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('a drawer replaces the back button and opens and closes',
      (tester) async {
    await pumpLayoutApp(
      tester,
      ImpaktfullUiScreen(
        title: 'Title',
        onBackTapped: () {},
        drawer: const SizedBox(width: 200, child: Text('drawer')),
        child: const SizedBox(),
      ),
    );
    final state = tester.state<ImpaktfullUiScreenState>(
      find.byType(ImpaktfullUiScreen),
    );
    expect(find.byTooltip('Back'), findsNothing);
    expect(find.text('drawer'), findsNothing);
    expect(state.isDrawerOpen, isFalse);
    expect(state.isDrawerClosed, isTrue);

    await tester.tap(find.byTooltip('Open Drawer'));
    await tester.pumpAndSettle();
    expect(find.text('drawer'), findsOneWidget);
    expect(state.isDrawerOpen, isTrue);
    expect(state.isDrawerClosed, isFalse);

    state.closeDrawer();
    await tester.pumpAndSettle();
    expect(find.text('drawer'), findsNothing);
    expect(state.isDrawerOpen, isFalse);
  });

  testWidgets('openDrawer without a drawer does nothing', (tester) async {
    await pumpLayoutApp(
      tester,
      const ImpaktfullUiScreen(title: 'Title', child: SizedBox()),
    );
    final state = tester.state<ImpaktfullUiScreenState>(
      find.byType(ImpaktfullUiScreen),
    );
    state.openDrawer();
    await tester.pumpAndSettle();
    expect(state.isDrawerOpen, isFalse);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a nested screen with isDrawerEnabled opens the parent drawer',
      (tester) async {
    await pumpLayoutApp(
      tester,
      const ImpaktfullUiScreen(
        drawer: SizedBox(width: 200, child: Text('drawer')),
        child: ImpaktfullUiScreen(
          title: 'Nested',
          isDrawerEnabled: true,
          child: SizedBox(),
        ),
      ),
    );
    await tester.tap(find.byTooltip('Open Drawer'));
    await tester.pumpAndSettle();
    expect(find.text('drawer'), findsOneWidget);
  });

  testWidgets('the drawer is at most the screen width minus 64',
      (tester) async {
    await pumpLayoutApp(
      tester,
      const ImpaktfullUiScreen(
        title: 'Title',
        drawer: SizedBox(width: 2000, child: Text('drawer')),
        child: SizedBox(),
      ),
    );
    await tester.tap(find.byTooltip('Open Drawer'));
    await tester.pumpAndSettle();
    final drawer = find
        .ancestor(of: find.text('drawer'), matching: find.byType(SizedBox))
        .first;
    expect(tester.getSize(drawer).width, smallScreenSize.width - 64);
  });

  testWidgets('shows the fab and the bottom child', (tester) async {
    var fabTaps = 0;
    await pumpLayoutApp(
      tester,
      ImpaktfullUiScreen(
        title: 'Title',
        floatingActionButton: ImpaktfullUiFloatingActionButton(
          asset: testAsset,
          onTap: () => fabTaps++,
        ),
        bottomChild: const SizedBox(height: 50, child: Text('bottom')),
        child: const SizedBox(),
      ),
    );
    expect(find.text('bottom'), findsOneWidget);
    // The bottom child is at the bottom of the screen.
    expect(
      tester.getBottomLeft(find.text('bottom')).dy,
      moreOrLessEquals(smallScreenSize.height, epsilon: 0.5),
    );
    // The fab is at the bottom right (default floatingActionButtonAlignment), above the bottom
    // child.
    final fab = find.byType(ImpaktfullUiFloatingActionButton);
    expect(tester.getBottomRight(fab).dx, smallScreenSize.width - 16);
    expect(
      tester.getBottomRight(fab).dy,
      lessThanOrEqualTo(tester.getTopLeft(find.text('bottom')).dy - 16),
    );
    await tester.tap(fab);
    await tester.pumpAndSettle();
    expect(fabTaps, 1);
  });

  testWidgets('canPop false blocks the pop and calls onPopInvoked',
      (tester) async {
    var popInvoked = 0;
    await pumpLayoutApp(
      tester,
      Builder(
        builder: (context) => TextButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (context) => ImpaktfullUiScreen(
              title: 'Second',
              canPop: false,
              onPopInvoked: () => popInvoked++,
              child: const SizedBox(),
            ),
          )),
          child: const Text('push'),
        ),
      ),
    );
    await tester.tap(find.text('push'));
    await tester.pumpAndSettle();
    expect(find.text('Second'), findsOneWidget);

    final navigator = tester.state<NavigatorState>(find.byType(Navigator));
    await navigator.maybePop();
    await tester.pumpAndSettle();
    expect(find.text('Second'), findsOneWidget);
    expect(popInvoked, 1);
  });

  testWidgets('tapping the body unfocuses the focused field', (tester) async {
    final focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    await pumpLayoutApp(
      tester,
      ImpaktfullUiScreen(
        child: Column(
          children: [
            TextField(focusNode: focusNode),
            const Expanded(child: SizedBox.expand()),
          ],
        ),
      ),
    );
    await tester.tap(find.byType(TextField));
    await tester.pump();
    expect(focusNode.hasFocus, isTrue);

    await tester.tapAt(const Offset(200, 600));
    await tester.pump();
    expect(focusNode.hasFocus, isFalse);
  });
}
