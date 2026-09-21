import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  final icons = ImpaktfullUiTheme.getDefault().assets.icons;

  runComponentTest(
    fileName: 'impaktfull_ui_input_field',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        child: goldenSized(ImpaktfullUiInputField(
          value: null,
          placeholder: 'Placeholder',
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiInputField(
          value: 'Filled value',
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiInputField(
          label: 'Label',
          value: 'With a label and hint',
          hint: 'This is a hint',
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiInputField(
          label: 'Error',
          value: 'Invalid value',
          error: 'This is an error',
          hint: 'The hint is hidden by the error',
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(const ImpaktfullUiInputField(
          label: 'Disabled',
          value: 'Disabled value',
          onChanged: null,
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiInputField(
          label: 'Read only',
          value: 'Read only value',
          readOnly: true,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiInputField(
          label: 'Password',
          value: 'password',
          obscureText: true,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiInputField(
          value: 'Search',
          leadingIcon: icons.search,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiInputField(
          value: 'With trailing action',
          trailingAction: ImpaktfullUiInputFieldAction(
            label: 'Copy',
            asset: icons.copy,
            onTap: () {},
          ),
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiInputField(
          value: 'With trailing input action',
          trailingInputActions: [
            ImpaktfullUiIconButton(asset: icons.close, onTap: () {}),
          ],
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiInputField(
          label: 'Multiline',
          value: 'Line 1\nLine 2\nLine 3\nLine 4',
          multiline: true,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiInputField(
          label: 'A very long label that does not fit on a single line of the '
              'input field',
          value:
              'A very long value that does not fit in the input field at all',
          hint: 'A very long hint that does not fit on a single line of the '
              'input field',
          onChanged: (_) {},
        )),
      ),
    ],
  );
}
