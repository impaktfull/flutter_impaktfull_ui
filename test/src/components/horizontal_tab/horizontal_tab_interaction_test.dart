import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  ImpaktfullUiHorizontalTabTheme tabTheme(WidgetTester tester) =>
      ImpaktfullUiHorizontalTabTheme.of(
          tester.element(find.byType(ImpaktfullUiHorizontalTab)));

  testWidgets('tapping calls onTap', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiHorizontalTab(label: 'Tab', onTap: () => taps++),
      ),
    );
    await tester.tap(find.text('Tab'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  for (final isSelected in [true, false]) {
    testWidgets('selected: $isSelected uses the matching style',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        Center(
          child: ImpaktfullUiHorizontalTab(
            label: 'Tab',
            isSelected: isSelected,
            onTap: () {},
          ),
        ),
      );
      final theme = tabTheme(tester);
      expect(
        tester.widget<Text>(find.text('Tab')).style,
        isSelected ? theme.textStyles.selected : theme.textStyles.unselected,
      );
      expect(
        tester
            .widget<ImpaktfullUiTouchFeedback>(
                find.byType(ImpaktfullUiTouchFeedback))
            .color,
        isSelected
            ? theme.colors.backgroundSelectedTab
            : theme.colors.backgroundUnSelectedTab,
      );
    });
  }

  testWidgets('no badge without a badge label', (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(child: ImpaktfullUiHorizontalTab(label: 'Tab', onTap: () {})),
    );
    expect(find.byType(ImpaktfullUiBadge), findsNothing);
  });

  final badgeCases = <String,
      ({
    bool isSelected,
    ImpaktfullUiBadgeType? badgeType,
    ImpaktfullUiBadgeType expected,
  })>{
    'selected ignores the badge type': (
      isSelected: true,
      badgeType: ImpaktfullUiBadgeType.error,
      expected: ImpaktfullUiBadgeType.primary,
    ),
    'unselected uses the badge type': (
      isSelected: false,
      badgeType: ImpaktfullUiBadgeType.error,
      expected: ImpaktfullUiBadgeType.error,
    ),
    'unselected defaults to primary': (
      isSelected: false,
      badgeType: null,
      expected: ImpaktfullUiBadgeType.primary,
    ),
  };
  for (final entry in badgeCases.entries) {
    testWidgets('badge: ${entry.key}', (tester) async {
      await pumpAndSettleComponent(
        tester,
        Center(
          child: ImpaktfullUiHorizontalTab(
            label: 'Tab',
            badge: '3',
            badgeType: entry.value.badgeType,
            isSelected: entry.value.isSelected,
            onTap: () {},
          ),
        ),
      );
      final badge = tester.widget<ImpaktfullUiBadge>(
        find.byType(ImpaktfullUiBadge),
      );
      expect(badge.type, entry.value.expected);
      expect(badge.size, ImpaktfullUiBadgeSize.small);
      expect(find.text('3'), findsOneWidget);
    });
  }
}
