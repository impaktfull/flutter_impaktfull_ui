import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('the progress is shown as a rounded percentage', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiFilePicker(
        progressType: ImpaktfullUiFilePickerProgressType.text,
        data: ImpaktfullUiFilePickerData(
          title: 'file.pdf',
          progress: 0.07,
        ),
      ),
    );
    expect(find.textContaining('7%', findRichText: true), findsOneWidget);
    expect(find.textContaining('7.0', findRichText: true), findsNothing);
  });
}
