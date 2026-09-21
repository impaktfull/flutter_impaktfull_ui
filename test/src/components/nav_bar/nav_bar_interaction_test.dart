import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  testWidgets('tapping back calls onBackTapped', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiNavBar(title: 'Title', onBackTapped: () => taps++),
    );
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('no back button without onBackTapped', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiNavBar(title: 'Title'),
    );
    expect(find.byTooltip('Back'), findsNothing);
    expect(find.byType(ImpaktfullUiIconButton), findsNothing);
  });

  testWidgets('the drawer button replaces the back button', (tester) async {
    var backTaps = 0;
    var drawerTaps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiNavBar(
        title: 'Title',
        onBackTapped: () => backTaps++,
        onDrawerTapped: () => drawerTaps++,
      ),
    );
    expect(find.byTooltip('Back'), findsNothing);
    await tester.tap(find.byTooltip('Open Drawer'));
    await tester.pumpAndSettle();
    expect(drawerTaps, 1);
    expect(backTaps, 0);
  });

  testWidgets('drawer tooltip follows isDrawerOpen', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiNavBar(
        title: 'Title',
        isDrawerOpen: true,
        onDrawerTapped: () {},
      ),
    );
    expect(find.byTooltip('Close Drawer'), findsOneWidget);
    expect(find.byTooltip('Open Drawer'), findsNothing);
  });

  testWidgets('full screen shows a trailing close button', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiNavBar(
        title: 'Title',
        isFullScreen: true,
        onBackTapped: () => taps++,
      ),
    );
    expect(find.byTooltip('Back'), findsNothing);
    final close = find.byTooltip('Close');
    expect(close, findsOneWidget);
    // The close button is trailing: right of the title.
    expect(
      tester.getCenter(close).dx,
      greaterThan(tester.getCenter(find.text('Title')).dx),
    );
    await tester.tap(close);
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('actions are shown and can be tapped', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiNavBar(
        title: 'Title',
        actions: [
          ImpaktfullUiIconButton(
            onTap: () => taps++,
            asset: testAsset,
            tooltip: 'Action',
          ),
        ],
      ),
    );
    await tester.tap(find.byTooltip('Action'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('shows title, subtitle and badge', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiNavBar(
        title: 'Title',
        subtitle: 'Subtitle',
        badge: 'Beta',
      ),
    );
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Subtitle'), findsOneWidget);
    expect(find.text('Beta'), findsOneWidget);
  });

  testWidgets('badge without a title', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiNavBar(badge: 'Beta'),
    );
    expect(find.text('Beta'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('centered title is centered between the actions', (tester) async {
    await pumpLayoutApp(
      tester,
      ImpaktfullUiNavBar(
        title: 'Title',
        centerTitle: true,
        onBackTapped: () {},
        actions: [
          ImpaktfullUiIconButton(onTap: () {}, asset: testAsset),
          ImpaktfullUiIconButton(onTap: () {}, asset: testAsset),
        ],
      ),
    );
    final navBarCenter = tester.getCenter(find.byType(ImpaktfullUiNavBar));
    expect(
      tester.getCenter(find.text('Title')).dx,
      moreOrLessEquals(navBarCenter.dx, epsilon: 0.5),
    );
  });

  testWidgets('centered title is centered with only trailing actions',
      (tester) async {
    await pumpLayoutApp(
      tester,
      ImpaktfullUiNavBar(
        title: 'Title',
        centerTitle: true,
        isFullScreen: true,
        onBackTapped: () {},
      ),
    );
    final navBarCenter = tester.getCenter(find.byType(ImpaktfullUiNavBar));
    expect(
      tester.getCenter(find.text('Title')).dx,
      moreOrLessEquals(navBarCenter.dx, epsilon: 0.5),
    );
  });

  testWidgets('uses custom localizations', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiNavBar(
        title: 'Title',
        onBackTapped: () {},
        localizations: const ImpaktfullUiNavBarLocalizations(
          backTooltip: 'Terug',
        ),
      ),
    );
    expect(find.byTooltip('Terug'), findsOneWidget);
    expect(find.byTooltip('Back'), findsNothing);
  });

  testWidgets('shows the bottom child below the title', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiNavBar(
        title: 'Title',
        bottomChild: Text('bottom'),
      ),
    );
    expect(
      tester.getTopLeft(find.text('bottom')).dy,
      greaterThan(tester.getBottomLeft(find.text('Title')).dy),
    );
  });
}
