import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  const data = ImpaktfullUiFilePickerData(
    title: 'document.pdf',
    subtitle: 'Uploading',
    size: 1536000,
    progress: 0.4,
  );

  runComponentTest(
    fileName: 'impaktfull_ui_file_picker',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        child: goldenSized(ImpaktfullUiFilePicker(
          title: 'Click to upload',
          subtitle: 'SVG, PNG, JPG or GIF (max. 800x400px)',
          onTap: () {},
        )),
      ),
      GoldenTest(
        child: goldenSized(const ImpaktfullUiFilePicker()),
      ),
      for (final progressType in ImpaktfullUiFilePickerProgressType.values) ...[
        GoldenTest(
          child: goldenSized(ImpaktfullUiFilePicker(
            data: data,
            progressType: progressType,
            onDeleteTapped: () {},
          )),
        ),
      ],
      GoldenTest(
        child: goldenSized(const ImpaktfullUiFilePicker(
          data: ImpaktfullUiFilePickerData(
            title: 'image.png',
            size: 2048,
          ),
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiFilePicker(
          data: data,
          onRetryTapped: () {},
          onDeleteTapped: () {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiFilePicker(
          data: const ImpaktfullUiFilePickerData(
            title: 'a_very_long_file_name_that_does_not_fit_on_a_single_line'
                '_of_the_file_picker.pdf',
            subtitle: 'A very long subtitle that does not fit on one line',
            progress: 1,
          ),
          onDeleteTapped: () {},
        )),
      ),
    ],
  );
}
