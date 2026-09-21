import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  final colors = [Colors.red, Colors.green, Colors.blue, Colors.orange];
  List<Widget> pages(int count) => [
        for (var i = 0; i < count; i++)
          Container(
            color: colors[i % colors.length].shade100,
            alignment: Alignment.center,
            child: Text('Page ${i + 1}'),
          ),
      ];

  runComponentTest(
    fileName: 'impaktfull_ui_carousel',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'first page',
        child: goldenBox(
          width: 240,
          height: 180,
          child: ImpaktfullUiCarousel(items: pages(3)),
        ),
      ),
      GoldenTest(
        description: 'initial index',
        child: goldenBox(
          width: 240,
          height: 180,
          child: ImpaktfullUiCarousel(items: pages(4), index: 2),
        ),
      ),
      GoldenTest(
        description: 'item margin',
        child: goldenBox(
          width: 240,
          height: 180,
          child: ImpaktfullUiCarousel(
            items: pages(3),
            itemMargin: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
      GoldenTest(
        description: 'single item: no indicator',
        child: goldenBox(
          width: 240,
          height: 180,
          child: ImpaktfullUiCarousel(items: pages(1)),
        ),
      ),
    ],
  );
}
