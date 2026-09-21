import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

/// The modal is rendered as a widget (not in a route): it centers its card
/// in the available space, so give it a fixed size.
GoldenTest _modal(
  String description,
  ImpaktfullUiModal modal, {
  double width = 432,
  double height = 320,
}) =>
    GoldenTest(
      description: description,
      child: SizedBox(width: width, height: height, child: modal),
    );

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_modal',
    columns: 2,
    goldenTests: () => [
      _modal(
        'Simple',
        ImpaktfullUiModal.simple(
          title: 'Delete project',
          subtitle: 'This can not be undone',
          content: 'Are you sure you want to delete this project?',
          secondaryActionLabel: 'Cancel',
          secondaryActionOnTap: () {},
          primaryActionLabel: 'Delete',
          primaryActionOnTap: () {},
        ),
      ),
      _modal(
        'Danger',
        ImpaktfullUiModal.simple(
          type: ImpaktfullUiModalType.danger,
          title: 'Delete project',
          content: 'Are you sure you want to delete this project?',
          secondaryActionLabel: 'Cancel',
          secondaryActionOnTap: () {},
          primaryActionLabel: 'Delete',
          primaryActionOnTap: () {},
        ),
      ),
      _modal(
        'Leading header icon',
        ImpaktfullUiModal.simple(
          headerChildLocation: ImpaktfullUiModalHeaderChildLocation.leading,
          headerIcon: ImpaktfullUiAsset.icon(PhosphorIcons.trash()),
          title: 'Delete project',
          subtitle: 'This can not be undone',
          primaryActionLabel: 'Delete',
          primaryActionOnTap: () {},
        ),
      ),
      _modal(
        'Header icon on top',
        ImpaktfullUiModal.simple(
          headerChildLocation: ImpaktfullUiModalHeaderChildLocation.top,
          headerIcon: ImpaktfullUiAsset.icon(PhosphorIcons.info()),
          headerIconColor: Colors.blue,
          title: 'Information',
          content: 'The header icon is shown above the title.',
          primaryActionLabel: 'Ok',
          primaryActionOnTap: () {},
        ),
      ),
      _modal(
        'Child with dividers and without close',
        ImpaktfullUiModal(
          title: 'Settings',
          hasClose: false,
          showDividers: true,
          secondaryActionLabel: 'Cancel',
          secondaryActionOnTap: () {},
          primaryActionLabel: 'Save',
          primaryActionOnTap: () {},
          child: const SizedBox(
            width: double.infinity,
            height: 60,
            child: ColoredBox(color: Color(0xFFE0E0E0)),
          ),
        ),
      ),
      _modal(
        'Only content',
        const ImpaktfullUiModal.simple(
          content: 'A modal without a header or actions.',
        ),
      ),
      _modal(
        'Wide modal stacks the actions',
        ImpaktfullUiModal.simple(
          width: 500,
          title: 'Wide modal',
          content: 'Wider than 400: the actions are shown vertically.',
          secondaryActionLabel: 'Cancel',
          secondaryActionOnTap: () {},
          primaryActionLabel: 'Continue',
          primaryActionOnTap: () {},
        ),
        width: 532,
        height: 360,
      ),
      _modal(
        'More than 2 actions',
        ImpaktfullUiModal(
          title: 'Choose',
          actions: [
            for (final label in ['First', 'Second', 'Third'])
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.secondaryGrey,
                title: label,
                onTap: () {},
              ),
          ],
        ),
        height: 360,
      ),
    ],
  );
}
