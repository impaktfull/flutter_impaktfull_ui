import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

/// The bottom sheet is rendered as a widget (not in a route) with the
/// width of a phone.
GoldenTest _sheet(
  String description,
  ImpaktfullUiBottomSheet sheet, {
  double width = 375,
}) =>
    GoldenTest(
      description: description,
      child: SizedBox(width: width, child: sheet),
    );

const _content = SizedBox(
  width: double.infinity,
  height: 60,
  child: ColoredBox(color: Color(0xFFE0E0E0)),
);

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_bottom_sheet',
    columns: 2,
    goldenTests: () => [
      _sheet(
        'Title and subtitle',
        const ImpaktfullUiBottomSheet(
          title: 'Share',
          subtitle: 'Choose how you want to share',
          child: _content,
        ),
      ),
      _sheet(
        'Handle',
        const ImpaktfullUiBottomSheet(
          title: 'With handle',
          showHandle: true,
          child: _content,
        ),
      ),
      _sheet(
        'Without close',
        const ImpaktfullUiBottomSheet(
          title: 'Without close',
          hasClose: false,
          child: _content,
        ),
      ),
      _sheet(
        'Actions next to each other',
        ImpaktfullUiBottomSheet(
          title: 'Actions',
          actions: [
            ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.secondaryGrey,
              title: 'Cancel',
              onTap: () {},
            ),
            ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Save',
              onTap: () {},
            ),
          ],
        ),
      ),
      _sheet(
        'Wide sheet stacks the actions',
        ImpaktfullUiBottomSheet(
          title: 'Wide',
          actions: [
            ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.secondaryGrey,
              title: 'Cancel',
              onTap: () {},
            ),
            ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Save',
              onTap: () {},
            ),
          ],
        ),
        width: 500,
      ),
      _sheet(
        'Custom padding',
        const ImpaktfullUiBottomSheet(
          title: 'Custom padding',
          padding: EdgeInsets.zero,
          child: _content,
        ),
      ),
    ],
  );
}
