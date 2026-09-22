import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/widget/wysiwyg_input.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/widget/wysiwyg_preview.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  const markdown = '# Title\n\nSome **bold** and _italic_ text.\n\n- Item 1\n'
      '- Item 2\n\n`code`';

  runComponentTest(
    fileName: 'impaktfull_ui_wysiwyg',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        child: goldenSized(
          ImpaktfullUiWysiwyg(value: markdown, onChanged: (_) {}),
          width: 400,
        ),
      ),
      GoldenTest(
        child: goldenSized(
          ImpaktfullUiWysiwyg(
            value: '',
            showPreview: false,
            onChanged: (_) {},
          ),
          width: 400,
        ),
      ),
      GoldenTest(
        child: goldenSized(
          ImpaktfullUiWysiwyg(
            value: 'Only bold and italic',
            showPreview: false,
            actions: const [
              ImpaktfullUiWysiwygAction.bold,
              ImpaktfullUiWysiwygAction.italic,
            ],
            onChanged: (_) {},
          ),
          width: 400,
        ),
      ),
      GoldenTest(
        child: goldenSized(
          ImpaktfullUiWysiwygInputField(
            value: '',
            placeholder: 'Write something',
            hint: 'Markdown is supported',
            type: ImpaktfullUiWysiwygType.markdown,
            actions: ImpaktfullUiWysiwygAction.values,
            onChanged: (_) {},
          ),
          width: 400,
        ),
      ),
      GoldenTest(
        child: goldenSized(
          ImpaktfullUiWysiwygInputField(
            value: 'Invalid',
            error: 'This text is not allowed',
            type: ImpaktfullUiWysiwygType.markdown,
            actions: ImpaktfullUiWysiwygAction.basicValues,
            onChanged: (_) {},
          ),
          width: 400,
        ),
      ),
      GoldenTest(
        child: goldenSized(
          const WysiwygPreview(
            text: markdown,
            type: ImpaktfullUiWysiwygType.markdown,
          ),
          width: 400,
        ),
      ),
    ],
  );
}
