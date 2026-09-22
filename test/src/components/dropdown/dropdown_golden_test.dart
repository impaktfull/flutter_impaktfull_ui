import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_dropdown',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        child: goldenSized(
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: ImpaktfullUiDropdown<void>(
              buttonTitle: 'Select an option',
              child: SizedBox(),
            ),
          ),
        ),
      ),
      GoldenTest(
        child: goldenSized(
          const ImpaktfullUiDropdown<void>(
            buttonTitle: 'Full width',
            fullWidth: true,
            child: SizedBox(),
          ),
        ),
      ),
      GoldenTest(
        child: goldenSized(
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: ImpaktfullUiDropdown<String>.builder(
              buttonTitle: 'Builder',
              items: const [],
              noDataLabel: 'No items',
              itemBuilder: (context, item, index, controller) =>
                  Text(item.title),
            ),
          ),
        ),
      ),
      GoldenTest(
        child: goldenSized(
          ImpaktfullUiDropdown<void>(
            button: (context) => const ImpaktfullUiBadge(
              type: ImpaktfullUiBadgeType.primary,
              title: 'Custom button',
            ),
            child: const SizedBox(),
          ),
        ),
      ),
      GoldenTest(
        child: goldenSized(
          const ImpaktfullUiDropdown<void>(
            buttonTitle: 'A very long dropdown button text that does not fit '
                'on a single line',
            fullWidth: true,
            child: SizedBox(),
          ),
        ),
      ),
    ],
  );
}
