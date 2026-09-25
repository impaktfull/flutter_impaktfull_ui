import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// Proves that the new tokens of [ImpaktfullUiHorizontalTabDimensTheme] change
/// what is rendered: both values were hardcoded in the widget.

ImpaktfullUiHorizontalTabTheme get _base =>
    ImpaktfullUiTheme.getDefault().components.horizontalTab;

ImpaktfullUiHorizontalTabTheme _tabTheme({
  EdgeInsetsGeometry? padding,
  double? badgeSpacing,
}) {
  final base = _base;
  return base.copyWith(
    dimens: base.dimens.copyWith(
      padding: padding,
      badgeSpacing: badgeSpacing,
    ),
  );
}

Future<void> _pumpTab(
  WidgetTester tester, {
  ImpaktfullUiHorizontalTabTheme? theme,
  String? badge,
  bool isSelected = false,
}) =>
    pumpImpaktfullUiApp(
      tester,
      Material(
        child: Align(
          alignment: Alignment.topLeft,
          child: ImpaktfullUiHorizontalTab(
            title: 'One',
            badge: badge,
            isSelected: isSelected,
            onTap: () {},
            theme: theme,
          ),
        ),
      ),
    );

/// The bar under the tab: the box that carries `selectedMarker`.
Finder _marker(Color color) => find.descendant(
      of: find.byType(ImpaktfullUiHorizontalTab),
      matching: find.byWidgetPredicate(
        (widget) =>
            widget is Container &&
            (widget.decoration as BoxDecoration?)?.color == color,
      ),
    );

ImpaktfullUiHorizontalTabTheme _markerTheme({
  double? height,
  double? width,
}) {
  final base = _base;
  return base.copyWith(
    colors: base.colors.copyWith(selectedMarker: const Color(0xFF1677FF)),
    dimens: base.dimens.copyWith(
      selectedMarkerHeight: height,
      selectedMarkerWidth: width,
    ),
  );
}

void main() {
  group('ImpaktfullUiHorizontalTabDimensTheme', () {
    testWidgets('padding is the space around the title', (tester) async {
      Offset padding(WidgetTester tester) {
        final tab = tester.getRect(find.byType(ImpaktfullUiHorizontalTab));
        final title = tester.getRect(find.text('One'));
        return Offset(title.left - tab.left, title.top - tab.top);
      }

      await _pumpTab(tester);
      expect(padding(tester), const Offset(12, 8));

      await _pumpTab(tester,
          theme: _tabTheme(padding: const EdgeInsets.all(2)));
      expect(padding(tester), const Offset(2, 2));
    });

    testWidgets('badgeSpacing is the space between the title and the badge',
        (tester) async {
      double spacing(WidgetTester tester) =>
          tester.getRect(find.byType(ImpaktfullUiBadge)).left -
          tester.getRect(find.text('One')).right;

      await _pumpTab(tester, badge: '3');
      expect(spacing(tester), 8);

      await _pumpTab(
        tester,
        badge: '3',
        theme: _tabTheme(badgeSpacing: 24),
      );
      expect(spacing(tester), 24);
    });
  });

  group('ImpaktfullUiHorizontalTabColorTheme.selectedMarker', () {
    const markerColor = Color(0xFF1677FF);

    testWidgets('a theme without one draws no bar', (tester) async {
      await _pumpTab(tester, isSelected: true);
      expect(_marker(markerColor), findsNothing);
    });

    testWidgets('only the selected tab has the bar', (tester) async {
      await _pumpTab(tester, theme: _markerTheme());
      expect(_marker(markerColor), findsNothing);

      await _pumpTab(tester, theme: _markerTheme(), isSelected: true);
      expect(_marker(markerColor), findsOneWidget);
    });

    testWidgets('the bar runs under the whole tab, at the bottom of it',
        (tester) async {
      await _pumpTab(
        tester,
        theme: _markerTheme(height: 2),
        isSelected: true,
      );
      final tab = tester.getRect(find.byType(ImpaktfullUiHorizontalTab));
      final marker = tester.getRect(_marker(markerColor));
      expect(marker.left, tab.left);
      expect(marker.right, tab.right);
      expect(marker.bottom, tab.bottom);
      expect(marker.height, 2);
    });

    testWidgets('the bar does not change the size of the tab', (tester) async {
      await _pumpTab(tester, isSelected: true);
      final without = tester.getSize(find.byType(ImpaktfullUiHorizontalTab));

      await _pumpTab(
        tester,
        theme: _markerTheme(height: 4),
        isSelected: true,
      );
      expect(tester.getSize(find.byType(ImpaktfullUiHorizontalTab)), without);
    });

    testWidgets('selectedMarkerWidth centers a narrower bar', (tester) async {
      await _pumpTab(
        tester,
        theme: _markerTheme(height: 2, width: 10),
        isSelected: true,
      );
      final tab = tester.getRect(find.byType(ImpaktfullUiHorizontalTab));
      final marker = tester.getRect(_marker(markerColor));
      expect(marker.width, 10);
      expect(marker.center.dx, tab.center.dx);
      expect(marker.bottom, tab.bottom);
    });
  });
}
