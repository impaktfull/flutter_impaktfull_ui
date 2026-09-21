import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  final icons = ImpaktfullUiTheme.getDefault().assets.icons;

  runComponentTest(
    fileName: 'impaktfull_ui_radio_button_list_item',
    columns: 2,
    goldenTests: () => [
      for (final groupValue in [1, 2]) ...[
        GoldenTest(
          child: goldenSized(ImpaktfullUiRadioButtonListItem<int>(
            title: 'Title',
            value: 1,
            groupValue: groupValue,
            onChanged: (_) {},
          )),
        ),
        GoldenTest(
          child: goldenSized(ImpaktfullUiRadioButtonListItem<int>(
            title: 'Disabled',
            value: 1,
            groupValue: groupValue,
            onChanged: null,
          )),
        ),
      ],
      GoldenTest(
        child: goldenSized(ImpaktfullUiRadioButtonListItem<int>(
          title: 'With subtitle and leading',
          subtitle: 'Subtitle',
          leading: icons.info,
          value: 1,
          groupValue: 1,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiRadioButtonListItem<int>(
          title: 'A very long title that does not fit on a single line of the '
              'list item',
          subtitle: 'A very long subtitle that does not fit on a single line '
              'of the list item',
          value: 1,
          groupValue: 2,
          onChanged: (_) {},
        )),
      ),
    ],
  );
}
