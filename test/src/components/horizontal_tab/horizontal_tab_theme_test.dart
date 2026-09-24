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
}) =>
    pumpImpaktfullUiApp(
      tester,
      Material(
        child: Align(
          alignment: Alignment.topLeft,
          child: ImpaktfullUiHorizontalTab(
            title: 'One',
            badge: badge,
            onTap: () {},
            theme: theme,
          ),
        ),
      ),
    );

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
}
