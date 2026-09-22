import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  Future<void> pumpItem(
    WidgetTester tester,
    ImpaktfullUiBottomNavigationItem item,
  ) =>
      pumpAndSettleComponent(
        tester,
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(width: 120, child: Row(children: [item])),
        ),
      );

  ImpaktfullUiBottomNavigationItemTheme itemTheme(WidgetTester tester) =>
      ImpaktfullUiBottomNavigationItemTheme.of(
          tester.element(find.byType(ImpaktfullUiBottomNavigationItem)));

  ImpaktfullUiAssetWidget assetWidget(WidgetTester tester) =>
      tester.widget<ImpaktfullUiAssetWidget>(find.byType(
        ImpaktfullUiAssetWidget,
      ));

  testWidgets('tapping calls onTap', (tester) async {
    var taps = 0;
    await pumpItem(
      tester,
      ImpaktfullUiBottomNavigationItem(
        asset: testAsset,
        title: 'Label',
        isSelected: false,
        onTap: () => taps++,
      ),
    );
    await tester.tap(find.text('Label'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('selected uses the selected asset and active colors',
      (tester) async {
    await pumpItem(
      tester,
      const ImpaktfullUiBottomNavigationItem(
        asset: testAsset,
        selectedAsset: testSelectedAsset,
        title: 'Label',
        isSelected: true,
      ),
    );
    final theme = itemTheme(tester);
    expect(assetWidget(tester).asset, testSelectedAsset);
    expect(assetWidget(tester).color, theme.colors.active);
    expect(
      tester.widget<Text>(find.text('Label')).style,
      theme.textStyles.activeLabel,
    );
  });

  testWidgets('unselected uses the asset and inactive colors', (tester) async {
    await pumpItem(
      tester,
      const ImpaktfullUiBottomNavigationItem(
        asset: testAsset,
        selectedAsset: testSelectedAsset,
        title: 'Label',
        isSelected: false,
      ),
    );
    final theme = itemTheme(tester);
    expect(assetWidget(tester).asset, testAsset);
    expect(assetWidget(tester).color, theme.colors.inactive);
    expect(
      tester.widget<Text>(find.text('Label')).style,
      theme.textStyles.inActiveLabel,
    );
  });

  testWidgets('selected without a selected asset keeps the asset',
      (tester) async {
    await pumpItem(
      tester,
      const ImpaktfullUiBottomNavigationItem(
        asset: testAsset,
        isSelected: true,
      ),
    );
    expect(assetWidget(tester).asset, testAsset);
  });

  final badgeCases = {
    'no badge': (badgeShow: false, badgeText: null, show: false),
    'badgeShow': (badgeShow: true, badgeText: null, show: true),
    'badgeText': (badgeShow: false, badgeText: '3', show: true),
  };
  for (final entry in badgeCases.entries) {
    testWidgets('badge: ${entry.key}', (tester) async {
      await pumpItem(
        tester,
        ImpaktfullUiBottomNavigationItem(
          asset: testAsset,
          isSelected: false,
          badgeShow: entry.value.badgeShow,
          badgeText: entry.value.badgeText,
        ),
      );
      final badge = tester.widget<ImpaktfullUiNotificationBadge>(
        find.byType(ImpaktfullUiNotificationBadge),
      );
      expect(badge.show, entry.value.show);
      expect(badge.text, entry.value.badgeText);
    });
  }

  for (final isSelected in [true, false]) {
    testWidgets('badge color (selected: $isSelected)', (tester) async {
      await pumpItem(
        tester,
        ImpaktfullUiBottomNavigationItem(
          asset: testAsset,
          isSelected: isSelected,
          badgeShow: true,
        ),
      );
      final theme = itemTheme(tester);
      final badge = tester.widget<ImpaktfullUiNotificationBadge>(
        find.byType(ImpaktfullUiNotificationBadge),
      );
      expect(
        badge.color,
        isSelected ? theme.colors.badgeActive : theme.colors.badgeInActive,
      );
    });
  }

  testWidgets('badgeColor overrides the theme', (tester) async {
    await pumpItem(
      tester,
      const ImpaktfullUiBottomNavigationItem(
        asset: testAsset,
        isSelected: true,
        badgeShow: true,
        badgeColor: Colors.green,
      ),
    );
    final badge = tester.widget<ImpaktfullUiNotificationBadge>(
      find.byType(ImpaktfullUiNotificationBadge),
    );
    expect(badge.color, Colors.green);
  });

  testWidgets('without showTitle the title is a tooltip', (tester) async {
    await pumpItem(
      tester,
      const ImpaktfullUiBottomNavigationItem(
        asset: testAsset,
        title: 'Label',
        showTitle: false,
        isSelected: false,
        onTap: _noop,
      ),
    );
    expect(find.text('Label'), findsNothing);
    expect(find.byTooltip('Label'), findsOneWidget);
  });

  testWidgets('with showTitle there is no tooltip', (tester) async {
    await pumpItem(
      tester,
      const ImpaktfullUiBottomNavigationItem(
        asset: testAsset,
        title: 'Label',
        isSelected: false,
        onTap: _noop,
      ),
    );
    expect(find.text('Label'), findsOneWidget);
    expect(find.byTooltip('Label'), findsNothing);
  });
}

void _noop() {}
