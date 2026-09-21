import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  Widget item({required bool selected}) => DefaultTabController(
        length: 2,
        initialIndex: selected ? 0 : 1,
        child: Builder(
          builder: (context) => ImpaktfullUiTabBarItem(
            label: 'Tab',
            index: 0,
            controller: DefaultTabController.of(context),
          ),
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_tab_bar_item',
    columns: 2,
    goldenTests: () => [
      layoutGoldenCase('Selected', item(selected: true), width: 150),
      layoutGoldenCase('Unselected', item(selected: false), width: 150),
    ],
  );
}
