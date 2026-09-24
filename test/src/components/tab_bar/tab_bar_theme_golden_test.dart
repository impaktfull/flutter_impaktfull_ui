import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

/// Freezes what the tokens of the tab bar make possible. Before them
/// `ImpaktfullUiTabBarColorTheme`, `ImpaktfullUiTabBarDimensTheme` and
/// `ImpaktfullUiTabBarItemColorTheme` could not change anything: the bar was a
/// row of items with a 4 px dot under the selected one.

ImpaktfullUiTabBarTheme get _baseBar =>
    ImpaktfullUiTheme.getDefault().components.tabBar;

ImpaktfullUiTabBarItemTheme get _baseItem =>
    ImpaktfullUiTheme.getDefault().components.tabBarItem;

/// A tab bar in the style of Ant Design: a line under the bar and an ink bar
/// of 2 px in the brand colour under the selected tab.
ImpaktfullUiTabBarTheme _antBarTheme() => _baseBar.copyWith(
      colors: _baseBar.colors.copyWith(divider: const Color(0xFFF0F0F0)),
    );

ImpaktfullUiTabBarItemTheme _antItemTheme() => _baseItem.copyWith(
      colors: _baseItem.colors.copyWith(
        selectedMarker: const Color(0xFF1677FF),
      ),
      dimens: ImpaktfullUiTabBarItemDimensTheme(
        selectedMarkerBorderRadius: BorderRadius.zero,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        spacing: 12,
        selectedMarkerHeight: 2,
        // No width: the ink bar is as wide as the tab.
        selectedMarkerWidth: null,
      ),
      textStyles: _baseItem.textStyles.copyWith(
        selectedLabel: _baseItem.textStyles.label.copyWith(
          color: const Color(0xFF1677FF),
        ),
      ),
    );

/// A tab bar in the style of shadcn/ui: a muted track with a rounded card as
/// the selected tab and no marker.
ImpaktfullUiTabBarTheme _shadcnBarTheme() => _baseBar.copyWith(
      colors: _baseBar.colors.copyWith(background: const Color(0xFFF5F5F5)),
      dimens: _baseBar.dimens.copyWith(
        padding: const EdgeInsets.all(3),
        height: 36,
        spacing: 3,
        borderRadius: BorderRadius.circular(10),
      ),
    );

ImpaktfullUiTabBarItemTheme _shadcnItemTheme() => _baseItem.copyWith(
      colors: _baseItem.colors.copyWith(
        background: const Color(0x00000000),
        selectedBackground: const Color(0xFFFFFFFF),
      ),
      dimens: ImpaktfullUiTabBarItemDimensTheme(
        selectedMarkerBorderRadius: BorderRadius.zero,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        spacing: 0,
        // No marker: the background of the selected tab marks it.
        selectedMarkerHeight: 0,
        selectedMarkerWidth: 0,
        borderRadius: BorderRadius.circular(8),
      ),
    );

Widget _tabBar({
  required ImpaktfullUiTabBarTheme barTheme,
  required ImpaktfullUiTabBarItemTheme itemTheme,
  int selected = 1,
  int length = 3,
}) =>
    DefaultTabController(
      length: length,
      initialIndex: selected,
      child: Builder(
        builder: (context) {
          final controller = DefaultTabController.of(context);
          return ImpaktfullUiTabBar(
            controller: controller,
            theme: barTheme,
            items: [
              for (var i = 0; i < length; i++)
                ImpaktfullUiTabBarItem(
                  title: 'Tab $i',
                  index: i,
                  controller: controller,
                  theme: itemTheme,
                ),
            ],
          );
        },
      ),
    );

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_tab_bar_tokens',
    goldenTests: () => [
      layoutGoldenCase(
        'Ant ink bar',
        _tabBar(barTheme: _antBarTheme(), itemTheme: _antItemTheme()),
        width: 400,
      ),
      layoutGoldenCase(
        'shadcn track',
        _tabBar(barTheme: _shadcnBarTheme(), itemTheme: _shadcnItemTheme()),
        width: 400,
      ),
      layoutGoldenCase(
        'Default',
        _tabBar(barTheme: _baseBar, itemTheme: _baseItem),
        width: 400,
      ),
    ],
  );
}
