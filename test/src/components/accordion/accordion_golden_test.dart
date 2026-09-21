import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  Widget content(BuildContext context) => Container(
        height: 60,
        alignment: Alignment.center,
        color: Colors.blue.shade100,
        child: const Text('Content'),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_accordion',
    columns: 2,
    goldenTests: () => [
      for (final expanded in [false, true]) ...[
        GoldenTest(
          description: 'expanded: $expanded',
          child: goldenBox(
            child: ImpaktfullUiAccordion(
              title: 'Title',
              expanded: expanded,
              expandedBuilder: content,
              onExpandedChanged: (_) {},
            ),
          ),
        ),
        GoldenTest(
          description: 'expanded: $expanded, subtitle',
          child: goldenBox(
            child: ImpaktfullUiAccordion(
              title: 'Title',
              subtitle: 'Subtitle',
              expanded: expanded,
              expandedBuilder: content,
              onExpandedChanged: (_) {},
            ),
          ),
        ),
        GoldenTest(
          description: 'expanded: $expanded, not animated',
          child: goldenBox(
            child: ImpaktfullUiAccordion(
              title: 'Title',
              expanded: expanded,
              animated: false,
              expandedBuilder: content,
              onExpandedChanged: (_) {},
            ),
          ),
        ),
        GoldenTest(
          description: 'expanded: $expanded, custom trailing',
          child: goldenBox(
            child: ImpaktfullUiAccordion(
              title: 'Title',
              expanded: expanded,
              expandedBuilder: content,
              trailingWidgetBuilder: (context) =>
                  ImpaktfullUiAssetWidget(asset: testIcon2),
              onExpandedChanged: (_) {},
            ),
          ),
        ),
      ],
      GoldenTest(
        description: 'long title',
        child: goldenBox(
          child: ImpaktfullUiAccordion(
            title: longText,
            subtitle: longText,
            expanded: true,
            expandedBuilder: content,
            onExpandedChanged: (_) {},
          ),
        ),
      ),
    ],
  );
}
