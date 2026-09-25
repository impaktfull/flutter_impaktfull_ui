import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('tapping back calls onBackTapped', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCmsHeader(title: 'Title', onBackTapped: () => taps++),
    );
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('the drawer button replaces the back button', (tester) async {
    var backTaps = 0;
    var drawerTaps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCmsHeader(
        title: 'Title',
        onBackTapped: () => backTaps++,
        onDrawerTapped: () => drawerTaps++,
      ),
    );
    expect(find.byTooltip('Back'), findsNothing);
    await tester.tap(find.byTooltip('Open drawer'));
    await tester.pumpAndSettle();
    expect(drawerTaps, 1);
    expect(backTaps, 0);
  });

  testWidgets('drawer tooltip follows isDrawerOpen', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCmsHeader(
        title: 'Title',
        isDrawerOpen: true,
        onDrawerTapped: () {},
      ),
    );
    expect(find.byTooltip('Close drawer'), findsOneWidget);
  });

  testWidgets('no leading button without callbacks', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiCmsHeader(title: 'Title'),
    );
    expect(find.byType(ImpaktfullUiIconButton), findsNothing);
  });

  testWidgets('shows title, badge, subtitle and actions', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCmsHeader(
        title: 'Title',
        subtitle: 'Subtitle',
        badge: 'Beta',
        actions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Save',
            onTap: () => taps++,
          ),
        ],
      ),
    );
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Subtitle'), findsOneWidget);
    expect(find.text('Beta'), findsOneWidget);
    // The badge is next to the title.
    expect(
      tester.getCenter(find.text('Beta')).dx,
      greaterThan(tester.getCenter(find.text('Title')).dx),
    );
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('has a minimum height of 64', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Align(
        alignment: Alignment.topCenter,
        child: ImpaktfullUiCmsHeader(title: 'Title'),
      ),
    );
    expect(
      tester.getSize(find.byType(ImpaktfullUiCmsHeader)).height,
      greaterThanOrEqualTo(64),
    );
  });

  testWidgets('shows the bottom child below the title', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiCmsHeader(
        title: 'Title',
        bottomChild: Text('bottom'),
      ),
    );
    expect(
      tester.getTopLeft(find.text('bottom')).dy,
      greaterThan(tester.getBottomLeft(find.text('Title')).dy),
    );
  });

  testWidgets('the actions are centred on each other and on the title',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCmsHeader(
        title: 'My custom title',
        actions: [
          // A button is taller than an icon button, which is what used to
          // hang the small one from the top of the row.
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondary,
            title: 'Refresh',
            onTap: () {},
          ),
          ImpaktfullUiIconButton(
            asset: ImpaktfullUiAsset.icon(Icons.add),
            onTap: () {},
          ),
        ],
      ),
    );
    final button = tester.getRect(find.byType(ImpaktfullUiButton));
    final iconButton = tester.getRect(find.byType(ImpaktfullUiIconButton));
    final title = tester.getRect(find.text('My custom title'));
    expect(iconButton.center.dy, button.center.dy);
    expect(iconButton.center.dy, closeTo(title.center.dy, 1));
  });
}
