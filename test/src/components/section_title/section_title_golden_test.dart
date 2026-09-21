import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_section_title',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'title',
        child: goldenBox(
          child: const ImpaktfullUiSectionTitle(title: 'Section'),
        ),
      ),
      GoldenTest(
        description: 'centered',
        child: goldenBox(
          child: const ImpaktfullUiSectionTitle(
            title: 'Section',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      GoldenTest(
        description: 'icon button actions',
        child: goldenBox(
          child: ImpaktfullUiSectionTitle(
            title: 'Section',
            actions: [
              ImpaktfullUiIconButton(asset: testIcon, onTap: () {}),
              ImpaktfullUiIconButton(asset: testIcon2, onTap: () {}),
            ],
          ),
        ),
      ),
      GoldenTest(
        description: 'button action',
        child: goldenBox(
          child: ImpaktfullUiSectionTitle(
            title: 'Section',
            actions: [
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.tertiary,
                size: ImpaktfullUiButtonSize.large,
                title: 'See all',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      GoldenTest(
        description: 'custom margin',
        child: goldenBox(
          child: const ImpaktfullUiSectionTitle(
            title: 'Section',
            margin: EdgeInsets.zero,
          ),
        ),
      ),
      GoldenTest(
        description: 'long title',
        child: goldenBox(
          child: ImpaktfullUiSectionTitle(
            title: longText,
            actions: [
              ImpaktfullUiIconButton(asset: testIcon, onTap: () {}),
            ],
          ),
        ),
      ),
    ],
  );
}
