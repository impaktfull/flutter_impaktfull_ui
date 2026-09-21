import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  Widget tabBar({required int selected, int length = 3}) =>
      DefaultTabController(
        length: length,
        initialIndex: selected,
        child: Builder(
          builder: (context) {
            final controller = DefaultTabController.of(context);
            return ImpaktfullUiTabBar(
              controller: controller,
              items: [
                for (var i = 0; i < length; i++)
                  ImpaktfullUiTabBarItem(
                    label: 'Tab $i',
                    index: i,
                    controller: controller,
                  ),
              ],
            );
          },
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_tab_bar',
    goldenTests: () => [
      layoutGoldenCase('First tab selected', tabBar(selected: 0), width: 400),
      layoutGoldenCase('Last tab selected', tabBar(selected: 2), width: 400),
      layoutGoldenCase(
        'Two tabs',
        tabBar(selected: 1, length: 2),
        width: 400,
      ),
    ],
  );
}
