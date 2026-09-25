import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// Proves that the tokens of [ImpaktfullUiTabBarColorTheme] and
/// [ImpaktfullUiTabBarDimensTheme] change what is rendered. Both classes had no
/// fields at all, so the bar was unthemeable.

ImpaktfullUiTabBarTheme get _base =>
    ImpaktfullUiTheme.getDefault().components.tabBar;

ImpaktfullUiTabBarTheme _tabBarTheme({
  Color? background,
  Color? divider,
  double? dividerHeight,
  double? height,
  EdgeInsetsGeometry? padding,
  double? spacing,
  BorderRadiusGeometry? borderRadius,
}) {
  final base = _base;
  return base.copyWith(
    colors: base.colors.copyWith(background: background, divider: divider),
    dimens: base.dimens.copyWith(
      borderRadius: borderRadius,
      dividerHeight: dividerHeight,
      height: height,
      padding: padding,
      spacing: spacing,
    ),
  );
}

/// A tab that marks itself with its background, not with a bar under its
/// title: nothing but the title then asks for height.
ImpaktfullUiTabBarItemTheme _itemWithoutMarker() {
  final base = ImpaktfullUiTheme.getDefault().components.tabBarItem;
  return base.copyWith(
    dimens: base.dimens.copyWith(selectedMarkerHeight: 0, spacing: 0),
  );
}

/// The decoration the bar paints behind its items, or null when it paints
/// none.
BoxDecoration? _decoration(WidgetTester tester) {
  final finder = find.descendant(
    of: find.byType(ImpaktfullUiTabBar),
    matching: find.byType(DecoratedBox),
  );
  if (finder.evaluate().isEmpty) return null;
  return tester.widget<DecoratedBox>(finder.first).decoration as BoxDecoration;
}

void main() {
  late TabController controller;

  setUp(() {
    controller = TabController(length: 2, vsync: const TestVSync());
  });

  tearDown(() => controller.dispose());

  Future<void> pumpTabBar(
    WidgetTester tester, {
    ImpaktfullUiTabBarTheme? theme,
  }) =>
      pumpImpaktfullUiApp(
        tester,
        Material(
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 300,
              child: ImpaktfullUiTabBar(
                controller: controller,
                items: const [Text('One'), Text('Two')],
                theme: theme,
              ),
            ),
          ),
        ),
      );

  group('ImpaktfullUiTabBarColorTheme', () {
    testWidgets('a bar without a background or a divider paints neither',
        (tester) async {
      await pumpTabBar(tester);
      expect(_decoration(tester), isNull);
    });

    testWidgets('background is the background behind the items',
        (tester) async {
      await pumpTabBar(
        tester,
        theme: _tabBarTheme(background: const Color(0xFFF5F5F5)),
      );
      expect(_decoration(tester)?.color, const Color(0xFFF5F5F5));
    });

    testWidgets('divider is the line under the bar', (tester) async {
      await pumpTabBar(
        tester,
        theme: _tabBarTheme(divider: const Color(0xFFE5E5E5)),
      );
      final border = _decoration(tester)?.border as Border?;
      expect(border?.bottom.color, const Color(0xFFE5E5E5));
      expect(border?.bottom.width, 1);
    });

    testWidgets('dividerHeight is the height of the line under the bar',
        (tester) async {
      await pumpTabBar(
        tester,
        theme: _tabBarTheme(
          divider: const Color(0xFFE5E5E5),
          dividerHeight: 3,
        ),
      );
      final border = _decoration(tester)?.border as Border?;
      expect(border?.bottom.width, 3);
    });

    testWidgets('borderRadius rounds the background of the bar',
        (tester) async {
      await pumpTabBar(
        tester,
        theme: _tabBarTheme(
          background: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(10),
        ),
      );
      expect(_decoration(tester)?.borderRadius, BorderRadius.circular(10));
    });
  });

  group('ImpaktfullUiTabBarDimensTheme', () {
    testWidgets('height is the height of the bar', (tester) async {
      await pumpTabBar(tester);
      final emergentHeight =
          tester.getSize(find.byType(ImpaktfullUiTabBar)).height;

      await pumpTabBar(tester, theme: _tabBarTheme(height: 36));
      expect(tester.getSize(find.byType(ImpaktfullUiTabBar)).height, 36);
      expect(emergentHeight, isNot(36));
    });

    testWidgets('padding is the space around the items', (tester) async {
      double padding(WidgetTester tester) =>
          tester.getRect(find.text('One')).left -
          tester.getRect(find.byType(ImpaktfullUiTabBar)).left;

      await pumpTabBar(tester);
      expect(padding(tester), 0);

      await pumpTabBar(
        tester,
        theme: _tabBarTheme(padding: const EdgeInsets.all(3)),
      );
      expect(padding(tester), 3);
    });

    testWidgets('spacing is the space between two items', (tester) async {
      double gap(WidgetTester tester) =>
          tester.getRect(find.text('Two')).left -
          tester.getRect(find.text('One')).right;

      await pumpTabBar(tester);
      expect(gap(tester), 0);

      await pumpTabBar(tester, theme: _tabBarTheme(spacing: 20));
      expect(gap(tester), 20);
    });
  });

  group('a bar with a height', () {
    testWidgets('fills it with its tabs, inside its padding', (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        Material(
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 300,
              child: ImpaktfullUiTabBar(
                controller: controller,
                items: [
                  for (var i = 0; i < 2; i++)
                    ImpaktfullUiTabBarItem(
                      title: 'Tab $i',
                      index: i,
                      controller: controller,
                      // A tab that is a filled box instead of an underline,
                      // so nothing but the title asks for height.
                      theme: _itemWithoutMarker(),
                    ),
                ],
                theme: _tabBarTheme(
                  // Taller than the tab needs for its title and its padding,
                  // which is the case the alignment is about.
                  height: 64,
                  padding: const EdgeInsets.all(4),
                ),
              ),
            ),
          ),
        ),
      );
      final bar = tester.getRect(find.byType(ImpaktfullUiTabBar));
      final item = tester.getRect(find.byType(ImpaktfullUiTabBarItem).first);
      expect(bar.height, 64);
      expect(item.top, bar.top + 4);
      expect(item.bottom, bar.bottom - 4);

      final title = tester.getRect(find.text('Tab 0'));
      expect(
        title.center.dy,
        item.center.dy,
        reason: 'the title is centred in the tab it fills',
      );
    });

    testWidgets('a bar without a height is as tall as its tabs',
        (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        Material(
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 300,
              child: ImpaktfullUiTabBar(
                controller: controller,
                items: [
                  for (var i = 0; i < 2; i++)
                    ImpaktfullUiTabBarItem(
                      title: 'Tab $i',
                      index: i,
                      controller: controller,
                    ),
                ],
              ),
            ),
          ),
        ),
      );
      final bar = tester.getRect(find.byType(ImpaktfullUiTabBar));
      final item = tester.getRect(find.byType(ImpaktfullUiTabBarItem).first);
      expect(item.height, bar.height);
    });
  });
}
