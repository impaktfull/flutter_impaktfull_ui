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

  group('disabled', () {
    testWidgets('without onTap it can not be tapped or focused',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiIconButton(asset: customTestAsset, onTap: null),
      );
      final button = tester
          .widget<ImpaktfullUiIconButton>(find.byType(ImpaktfullUiIconButton));
      expect(button.isDisabled, isTrue);
      expect(button.isEnabled, isFalse);
      final touchFeedback = tester.widget<ImpaktfullUiTouchFeedback>(
          find.byType(ImpaktfullUiTouchFeedback));
      expect(touchFeedback.onTap, isNull);
      expect(touchFeedback.canRequestFocus, isFalse);
      await tester.tap(find.byType(ImpaktfullUiIconButton));
      await tester.pump();
      expect(tester.takeException(), isNull);
    });

    testWidgets('is shown with the disabled opacity of the theme',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiIconButton(asset: customTestAsset, onTap: null),
      );
      final opacity = tester.widget<Opacity>(find.descendant(
        of: find.byType(ImpaktfullUiIconButton),
        matching: find.byType(Opacity),
      ));
      expect(opacity.opacity, 0.5);
    });

    testWidgets('an enabled icon button has no opacity', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiIconButton(asset: customTestAsset, onTap: () {}),
      );
      expect(
        find.descendant(
          of: find.byType(ImpaktfullUiIconButton),
          matching: find.byType(Opacity),
        ),
        findsNothing,
      );
    });
  });

  group('onTap getter', () {
    test('calls the callback when enabled', () {
      var taps = 0;
      final button = ImpaktfullUiIconButton(
        asset: customTestAsset,
        onTap: () => taps++,
      );
      expect(button.isEnabled, isTrue);
      expect(button.isDisabled, isFalse);
      // The getter is not nullable, so existing code that calls it compiles.
      button.onTap();
      expect(taps, 1);
    });

    test('is a function that does nothing when disabled', () {
      final button = ImpaktfullUiIconButton(
        asset: customTestAsset,
        onTap: null,
      );
      expect(button.isEnabled, isFalse);
      button.onTap();
      final VoidCallback callback = button.onTap;
      expect(callback, isNotNull);
    });

    test('overrideColor keeps the callback', () {
      var taps = 0;
      final button = ImpaktfullUiIconButton(
        asset: customTestAsset,
        onTap: () => taps++,
      ).overrideColor(customTestColor);
      expect(button.isEnabled, isTrue);
      button.onTap();
      expect(taps, 1);
    });
  });

  group('theme', () {
    testWidgets('the default theme keeps the previous look', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiIconButton(asset: customTestAsset, onTap: () {}),
      );
      final assetWidget = tester.widget<ImpaktfullUiAssetWidget>(
          find.byWidgetPredicate(isAssetWidget(customTestAsset)));
      expect(assetWidget.size, 16);
      expect(assetWidget.color, isNull);
      final padding = tester.widget<Padding>(find
          .ancestor(
            of: find.byType(ImpaktfullUiNotificationBadge),
            matching: find.byType(Padding),
          )
          .first);
      expect(padding.padding, const EdgeInsets.all(12));
      final touchFeedback = tester.widget<ImpaktfullUiTouchFeedback>(
          find.byType(ImpaktfullUiTouchFeedback));
      expect(touchFeedback.borderRadius,
          const BorderRadius.all(Radius.circular(9999)));
      expect(touchFeedback.color, isNull);
    });

    testWidgets('the theme override is used', (tester) async {
      const theme = ImpaktfullUiIconButtonTheme(
        assets: ImpaktfullUiIconButtonAssetsTheme(),
        colors: ImpaktfullUiIconButtonColorTheme(
          icon: customTestColor,
          background: Colors.yellow,
        ),
        dimens: ImpaktfullUiIconButtonDimensTheme(
          padding: EdgeInsets.all(4),
          iconSize: 40,
          borderRadius: BorderRadius.all(Radius.circular(2)),
          disabledOpacity: 0.25,
        ),
      );
      await pumpAndSettleComponent(
        tester,
        Center(
          child: ImpaktfullUiIconButton(
            asset: customTestAsset,
            onTap: null,
            theme: theme,
          ),
        ),
      );
      final assetWidget = tester.widget<ImpaktfullUiAssetWidget>(
          find.byWidgetPredicate(isAssetWidget(customTestAsset)));
      expect(assetWidget.size, 40);
      expect(assetWidget.color, customTestColor);
      final touchFeedback = tester.widget<ImpaktfullUiTouchFeedback>(
          find.byType(ImpaktfullUiTouchFeedback));
      expect(touchFeedback.borderRadius,
          const BorderRadius.all(Radius.circular(2)));
      expect(touchFeedback.color, Colors.yellow);
      expect(tester.getSize(find.byType(ImpaktfullUiIconButton)),
          const Size(48, 48));
      final opacity = tester.widget<Opacity>(find.descendant(
        of: find.byType(ImpaktfullUiIconButton),
        matching: find.byType(Opacity),
      ));
      expect(opacity.opacity, 0.25);
    });

    testWidgets('the size and colors of the widget win over the theme',
        (tester) async {
      final theme = ImpaktfullUiIconButtonTheme.fallback.copyWith(
        colors: const ImpaktfullUiIconButtonColorTheme(
          icon: Colors.yellow,
          background: Colors.yellow,
        ),
        dimens:
            ImpaktfullUiIconButtonTheme.fallback.dimens.copyWith(iconSize: 40),
      );
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiIconButton(
          asset: customTestAsset,
          size: 20,
          color: customTestColor,
          backgroundColor: customTestColor,
          onTap: () {},
          theme: theme,
        ),
      );
      final assetWidget = tester.widget<ImpaktfullUiAssetWidget>(
          find.byWidgetPredicate(isAssetWidget(customTestAsset)));
      expect(assetWidget.size, 20);
      expect(assetWidget.color, customTestColor);
      final touchFeedback = tester.widget<ImpaktfullUiTouchFeedback>(
          find.byType(ImpaktfullUiTouchFeedback));
      expect(touchFeedback.color, customTestColor);
    });

    test('size is 16 when none is passed', () {
      expect(ImpaktfullUiIconButton(asset: customTestAsset, onTap: () {}).size,
          16);
    });

    test('overrideColor keeps the theme and an unset size', () {
      const theme = ImpaktfullUiIconButtonTheme.fallback;
      final button = ImpaktfullUiIconButton(
        asset: customTestAsset,
        onTap: null,
        theme: theme,
      ).overrideColor(customTestColor);
      expect(button.theme, same(theme));
      expect(button.isDisabled, isTrue);
      expect(button.size, 16);
    });

    test('ImpaktfullUiComponentsTheme falls back without iconButton', () {
      final components = ImpaktfullUiTheme.getDefault().components;
      expect(components.iconButton, same(ImpaktfullUiIconButtonTheme.fallback));
      final copy = components.copyWith(
        iconButton: ImpaktfullUiIconButtonTheme.fallback.copyWith(
          dimens: const ImpaktfullUiIconButtonDimensTheme(iconSize: 24),
        ),
      );
      expect(copy.iconButton.dimens.iconSize, 24);
    });
  });
}
