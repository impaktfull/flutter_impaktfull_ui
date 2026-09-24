import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// Proves that the tokens of [ImpaktfullUiTabBarItemTheme] change what is
/// rendered: the padding, the marker of the selected item and the colours and
/// the text style of the selected state.

ImpaktfullUiTabBarItemTheme get _base =>
    ImpaktfullUiTheme.getDefault().components.tabBarItem;

ImpaktfullUiTabBarItemTheme _itemTheme({
  Color? selectedBackground,
  Color? selectedMarker,
  EdgeInsetsGeometry? padding,
  double? spacing,
  double? selectedMarkerHeight,
  double? selectedMarkerWidth,
  BorderRadiusGeometry? borderRadius,
  TextStyle? selectedLabel,
}) {
  final base = _base;
  return base.copyWith(
    colors: base.colors.copyWith(
      selectedBackground: selectedBackground,
      selectedMarker: selectedMarker,
    ),
    dimens: base.dimens.copyWith(
      borderRadius: borderRadius,
      padding: padding,
      spacing: spacing,
      selectedMarkerHeight: selectedMarkerHeight,
      // `copyWith` keeps the default of 4 for null, so a stretching marker
      // needs its own theme.
      selectedMarkerWidth: selectedMarkerWidth,
    ),
    textStyles: base.textStyles.copyWith(selectedLabel: selectedLabel),
  );
}

/// The theme of an item whose marker stretches over its full width, like an
/// ink bar.
ImpaktfullUiTabBarItemTheme _stretchingMarkerTheme() {
  final base = _base;
  return base.copyWith(
    dimens: ImpaktfullUiTabBarItemDimensTheme(
      selectedMarkerBorderRadius: base.dimens.selectedMarkerBorderRadius,
      selectedMarkerHeight: 2,
      selectedMarkerWidth: null,
    ),
  );
}

/// The container of the marker under the item.
Finder _marker() => find.descendant(
      of: find.byType(AnimatedOpacity),
      matching: find.byType(Container),
    );

BoxDecoration _markerDecoration(WidgetTester tester) =>
    tester.widget<Container>(_marker()).decoration! as BoxDecoration;

/// The row of the title and the marker: everything inside the padding of the
/// item.
Finder _content() => find
    .descendant(
      of: find.byType(ImpaktfullUiTabBarItem),
      matching: find.byType(ImpaktfullUiAutoLayout),
    )
    .first;

/// The container the item paints its own background in: the closest container
/// around its content, inside the container of the touch feedback.
BoxDecoration _itemDecoration(WidgetTester tester) => tester
    .widget<Container>(
        find.ancestor(of: _content(), matching: find.byType(Container)).first)
    .decoration! as BoxDecoration;

void main() {
  late TabController controller;

  setUp(() {
    controller = TabController(length: 2, vsync: const TestVSync());
  });

  tearDown(() => controller.dispose());

  /// Pumps the item of [index], with the first tab selected.
  Future<void> pumpItem(
    WidgetTester tester, {
    int index = 0,
    ImpaktfullUiTabBarItemTheme? theme,
  }) =>
      pumpImpaktfullUiApp(
        tester,
        Material(
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 200,
              child: ImpaktfullUiTabBarItem(
                title: 'One',
                index: index,
                controller: controller,
                theme: theme,
              ),
            ),
          ),
        ),
      );

  group('ImpaktfullUiTabBarItemDimensTheme', () {
    testWidgets('padding is the space around the title', (tester) async {
      Offset padding(WidgetTester tester) {
        final item = tester.getRect(find.byType(ImpaktfullUiTabBarItem));
        final content = tester.getRect(_content());
        return Offset(content.left - item.left, content.top - item.top);
      }

      await pumpItem(tester);
      expect(padding(tester), const Offset(16, 12));

      await pumpItem(
        tester,
        theme: _itemTheme(padding: const EdgeInsets.all(30)),
      );
      expect(padding(tester), const Offset(30, 30));
    });

    testWidgets('spacing is the space between the title and the marker',
        (tester) async {
      double spacing(WidgetTester tester) =>
          tester.getRect(_marker()).top -
          tester.getRect(find.text('One')).bottom;

      await pumpItem(tester);
      expect(spacing(tester), 4);

      await pumpItem(tester, theme: _itemTheme(spacing: 16));
      expect(spacing(tester), 16);
    });

    testWidgets('selectedMarkerHeight and selectedMarkerWidth size the marker',
        (tester) async {
      await pumpItem(tester);
      expect(tester.getSize(_marker()), const Size(4, 4));

      await pumpItem(
        tester,
        theme: _itemTheme(selectedMarkerHeight: 2, selectedMarkerWidth: 24),
      );
      expect(tester.getSize(_marker()), const Size(24, 2));
    });

    testWidgets(
        'a marker without a width stretches over the item, as an ink bar',
        (tester) async {
      await pumpItem(tester, theme: _stretchingMarkerTheme());
      // Ant Design's ink bar: 2 high, over the full width of the content of
      // the item (200 wide minus its padding of 16 on both sides).
      expect(tester.getSize(_marker()), const Size(168, 2));
    });

    testWidgets('borderRadius rounds the background of the item',
        (tester) async {
      await pumpItem(tester);
      expect(_itemDecoration(tester).borderRadius, isNull);

      await pumpItem(
        tester,
        theme: _itemTheme(borderRadius: BorderRadius.circular(10)),
      );
      expect(
        _itemDecoration(tester).borderRadius,
        BorderRadius.circular(10),
      );
    });
  });

  group('ImpaktfullUiTabBarItemColorTheme', () {
    testWidgets('selectedBackground is the background of the selected item',
        (tester) async {
      final background = _base.colors.background;
      await pumpItem(tester);
      expect(_itemDecoration(tester).color, background);

      // The selected item (index 0) uses the selected background, an
      // unselected one keeps the normal background.
      final theme = _itemTheme(selectedBackground: const Color(0xFFFFFFFF));
      await pumpItem(tester, theme: theme);
      expect(_itemDecoration(tester).color, const Color(0xFFFFFFFF));

      await pumpItem(tester, index: 1, theme: theme);
      expect(_itemDecoration(tester).color, background);
    });

    testWidgets('selectedMarker is the colour of the marker', (tester) async {
      await pumpItem(tester);
      // Without a colour the marker takes the colour of the title.
      expect(_markerDecoration(tester).color, _base.textStyles.label.color);

      await pumpItem(
        tester,
        theme: _itemTheme(selectedMarker: const Color(0xFF1677FF)),
      );
      expect(_markerDecoration(tester).color, const Color(0xFF1677FF));
    });
  });

  group('ImpaktfullUiTabBarItemTextStyleTheme', () {
    testWidgets('selectedLabel is the text style of the selected item',
        (tester) async {
      TextStyle? style(WidgetTester tester) =>
          tester.widget<Text>(find.text('One')).style;

      await pumpItem(tester);
      expect(style(tester), _base.textStyles.label);

      const selected = TextStyle(fontSize: 22, color: Color(0xFF1677FF));
      final theme = _itemTheme(selectedLabel: selected);
      await pumpItem(tester, theme: theme);
      expect(style(tester), selected);
      // The marker follows the colour of the selected title.
      expect(_markerDecoration(tester).color, const Color(0xFF1677FF));

      await pumpItem(tester, index: 1, theme: theme);
      expect(style(tester), _base.textStyles.label);
    });
  });
}
