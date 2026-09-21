import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_data_display_test_helpers.dart';

void main() {
  final chevronRight = ImpaktfullUiTheme.getDefault().assets.icons.chevronRight;

  testWidgets('onTap is called on tap', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiListItem(title: 'Title', onTap: () => taps++),
    );
    await tester.tap(find.text('Title'));
    await tester.tap(find.text('Title'));
    expect(taps, 2);
  });

  testWidgets('onTap wins over onAsyncTap', (tester) async {
    var taps = 0;
    var asyncTaps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiListItem(
        title: 'Title',
        onTap: () => taps++,
        onAsyncTap: () async => asyncTaps++,
      ),
    );
    await tester.tap(find.text('Title'));
    await tester.pumpAndSettle();
    expect(taps, 1);
    expect(asyncTaps, 0);
  });

  testWidgets('onAsyncTap shows a loading indicator until it completes',
      (tester) async {
    final completer = Completer<void>();
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiListItem(
        title: 'Title',
        onAsyncTap: () => completer.future,
      ),
    );
    expect(findAsset(chevronRight), findsOneWidget);
    expect(find.byType(ImpaktfullUiLoadingIndicator), findsNothing);

    await tester.tap(find.text('Title'));
    await tester.pump();
    expect(find.byType(ImpaktfullUiLoadingIndicator), findsOneWidget);
    expect(findAsset(chevronRight), findsNothing);

    completer.complete();
    await tester.pumpAndSettle();
    expect(find.byType(ImpaktfullUiLoadingIndicator), findsNothing);
    expect(findAsset(chevronRight), findsOneWidget);
  });

  testWidgets('without a tap callback there is no chevron and no feedback',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiListItem(title: 'Title'),
    );
    expect(findAsset(chevronRight), findsNothing);
    final touchFeedback = tester.widget<ImpaktfullUiTouchFeedback>(
      find.byType(ImpaktfullUiTouchFeedback),
    );
    expect(touchFeedback.onTap, isNull);
  });

  testWidgets('a clickable item shows the trailing asset instead of a chevron',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiListItem(title: 'Title', trailing: testIcon2, onTap: () {}),
    );
    expect(findAsset(testIcon2), findsOneWidget);
    expect(findAsset(chevronRight), findsNothing);
  });

  testWidgets('danger items use the danger color for the leading icon',
      (tester) async {
    final listItemTheme = ImpaktfullUiTheme.getDefault().components.listItem;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiListItem(
        title: 'Title',
        leading: testIcon,
        type: ImpaktfullUiListItemType.danger,
      ),
    );
    expect(
      tester.widget<ImpaktfullUiAssetWidget>(findAsset(testIcon)).color,
      listItemTheme.colors.danger,
    );
  });

  test('every type maps to a simple list item type', () {
    expect(
      ImpaktfullUiListItemType.neutral.simpleListItemType,
      ImpaktfullUiSimpleListItemType.neutral,
    );
    expect(
      ImpaktfullUiListItemType.danger.simpleListItemType,
      ImpaktfullUiSimpleListItemType.danger,
    );
  });

  testWidgets('does not throw when disposed while onAsyncTap is running',
      (tester) async {
    final completer = Completer<void>();
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiListItem(
        title: 'Title',
        onAsyncTap: () => completer.future,
      ),
    );
    await tester.tap(find.text('Title'));
    await tester.pump();
    await tester.pumpWidget(const SizedBox());
    completer.complete();
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
