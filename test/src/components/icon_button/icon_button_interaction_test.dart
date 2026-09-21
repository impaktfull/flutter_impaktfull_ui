import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  testWidgets('onTap is called once for every tap', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiIconButton(
        asset: customTestAsset,
        onTap: () => taps++,
      ),
    );
    await tester.tap(find.byType(ImpaktfullUiIconButton));
    await tester.pump();
    await tester.tap(find.byType(ImpaktfullUiIconButton));
    await tester.pump();
    expect(taps, 2);
  });

  testWidgets('the asset is shown with the color and size', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiIconButton(
        asset: customTestAsset,
        color: customTestColor,
        size: 32,
        onTap: () {},
      ),
    );
    final assetWidget = tester.widget<ImpaktfullUiAssetWidget>(
        find.byWidgetPredicate(isAssetWidget(customTestAsset)));
    expect(assetWidget.color, customTestColor);
    expect(assetWidget.size, 32);
  });

  testWidgets('the tooltip and background color are forwarded', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiIconButton(
        asset: customTestAsset,
        tooltip: 'Favorite',
        backgroundColor: customTestColor,
        onTap: () {},
      ),
    );
    final touchFeedback = tester.widget<ImpaktfullUiTouchFeedback>(
        find.byType(ImpaktfullUiTouchFeedback));
    expect(touchFeedback.tooltip, 'Favorite');
    expect(touchFeedback.color, customTestColor);
  });

  group('notification badge', () {
    bool isBadgeShown(WidgetTester tester) => tester
        .widget<ImpaktfullUiNotificationBadge>(
            find.byType(ImpaktfullUiNotificationBadge))
        .show;

    testWidgets('is hidden by default', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiIconButton(asset: customTestAsset, onTap: () {}),
      );
      expect(isBadgeShown(tester), isFalse);
    });

    testWidgets('is shown with showNotificationBadge', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiIconButton(
          asset: customTestAsset,
          showNotificationBadge: true,
          onTap: () {},
        ),
      );
      expect(isBadgeShown(tester), isTrue);
    });

    testWidgets('is shown when a text is set', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiIconButton(
          asset: customTestAsset,
          notificationBadgeText: '5',
          onTap: () {},
        ),
      );
      expect(isBadgeShown(tester), isTrue);
      expect(find.text('5'), findsOneWidget);
    });
  });

  group('overrideColor', () {
    test('sets the color when no color is set', () {
      final button = ImpaktfullUiIconButton(
        asset: customTestAsset,
        tooltip: 'Tooltip',
        size: 20,
        onTap: () {},
      ).overrideColor(customTestColor);
      expect(button.color, customTestColor);
      expect(button.tooltip, 'Tooltip');
      expect(button.size, 20);
      expect(button.asset, customTestAsset);
    });

    test('keeps the color when a color is set', () {
      final button = ImpaktfullUiIconButton(
        asset: customTestAsset,
        color: Colors.red,
        onTap: () {},
      );
      expect(identical(button.overrideColor(customTestColor), button), isTrue);
    });
  });

  testWidgets('enter activates the focused icon button', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiIconButton(
        asset: customTestAsset,
        onTap: () => taps++,
      ),
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(taps, 1);
  });

  testWidgets('canRequestFocus false can not be focused', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiIconButton(
        asset: customTestAsset,
        canRequestFocus: false,
        onTap: () => taps++,
      ),
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(taps, 0);
  });
}
