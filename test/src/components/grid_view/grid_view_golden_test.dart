import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  const placeholderData = ImpaktfullUiGridViewPlaceholderData(
    title: 'No items',
    subtitle: 'There is nothing to show yet',
  );
  final items = [for (var i = 1; i <= 7; i++) i];

  Widget tile(BuildContext context, int item, int index) => Container(
        alignment: Alignment.center,
        color: Colors.blue.shade100,
        child: Text('$item'),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_grid_view',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        description: '3 columns',
        child: goldenBox(
          width: 240,
          height: 260,
          child: ImpaktfullUiGridView<int>.builder(
            items: items,
            crossAxisCount: (context, config) => 3,
            itemBuilder: tile,
            placeholderData: placeholderData,
          ),
        ),
      ),
      GoldenTest(
        description: '2 columns, spacing and aspect ratio',
        child: goldenBox(
          width: 240,
          height: 260,
          child: ImpaktfullUiGridView<int>.builder(
            items: items,
            spacing: 8,
            padding: const EdgeInsets.all(8),
            crossAxisCount: (context, config) => 2,
            itemAspectRatio: (context, config) => 2,
            itemBuilder: tile,
            placeholderData: placeholderData,
          ),
        ),
      ),
      GoldenTest(
        description: 'crossAxisCount based on the width',
        child: goldenBox(
          width: 240,
          height: 260,
          child: ImpaktfullUiGridView<int>.builder(
            items: items,
            spacing: 4,
            crossAxisCount: (context, config) => config.maxWidth ~/ 50,
            itemBuilder: tile,
            placeholderData: placeholderData,
          ),
        ),
      ),
      GoldenTest(
        description: 'children',
        child: goldenBox(
          width: 240,
          height: 260,
          child: ImpaktfullUiGridView<Widget>(
            crossAxisCount: (context, config) => 2,
            spacing: 8,
            placeholderData: placeholderData,
            children: [
              for (var i = 0; i < 4; i++)
                Container(
                  color: Colors.green.shade100,
                  alignment: Alignment.center,
                  child: Text('Child $i'),
                ),
            ],
          ),
        ),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_grid_view_states',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        description: 'loading',
        child: frozen(
          goldenBox(
            width: 240,
            height: 260,
            child: ImpaktfullUiGridView<int>.builder(
              items: items,
              isLoading: true,
              crossAxisCount: (context, config) => 3,
              itemBuilder: tile,
              placeholderData: placeholderData,
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'empty',
        child: goldenBox(
          width: 240,
          height: 260,
          child: ImpaktfullUiGridView<int>.builder(
            items: const [],
            crossAxisCount: (context, config) => 3,
            itemBuilder: tile,
            placeholderData: placeholderData,
          ),
        ),
      ),
      GoldenTest(
        description: 'empty with refresh',
        child: goldenBox(
          width: 240,
          height: 260,
          child: ImpaktfullUiGridView<int>.builder(
            items: const [],
            crossAxisCount: (context, config) => 3,
            itemBuilder: tile,
            onRefresh: () async {},
            placeholderData: placeholderData,
          ),
        ),
      ),
    ],
  );
}
