import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_placeholder',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        description: 'title',
        child: goldenBox(
          width: 240,
          child: const ImpaktfullUiPlaceholder(title: 'Nothing here'),
        ),
      ),
      GoldenTest(
        description: 'title + subtitle',
        child: goldenBox(
          width: 240,
          child: const ImpaktfullUiPlaceholder(
            title: 'Nothing here',
            subtitle: 'Add an item to get started',
          ),
        ),
      ),
      GoldenTest(
        description: 'asset',
        child: goldenBox(
          width: 240,
          child: ImpaktfullUiPlaceholder(
            asset: testIcon,
            title: 'Nothing here',
          ),
        ),
      ),
      GoldenTest(
        description: 'asset builder',
        child: goldenBox(
          width: 240,
          child: ImpaktfullUiPlaceholder(
            assetBuilder: (context) => Container(
              width: 48,
              height: 48,
              color: Colors.orange,
            ),
            title: 'Nothing here',
          ),
        ),
      ),
      GoldenTest(
        description: 'actions without asset',
        child: goldenBox(
          width: 240,
          child: ImpaktfullUiPlaceholder(
            title: 'Nothing here',
            actions: [
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.secondary,
                title: 'Cancel',
                onTap: () {},
              ),
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.primary,
                title: 'Add',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      GoldenTest(
        description: 'custom styles and margin',
        child: goldenBox(
          width: 240,
          child: const ImpaktfullUiPlaceholder(
            title: 'Error',
            subtitle: 'Something went wrong',
            titleStyle: TextStyle(color: Colors.red, fontSize: 20),
            subtitleStyle: TextStyle(color: Colors.orange),
            margin: EdgeInsets.all(24),
          ),
        ),
      ),
      GoldenTest(
        description: 'long text',
        child: goldenBox(
          width: 240,
          child: const ImpaktfullUiPlaceholder(
            title: longText,
            subtitle: longText,
          ),
        ),
      ),
    ],
  );
}
