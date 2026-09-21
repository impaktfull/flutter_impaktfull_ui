import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  final icons = ImpaktfullUiTheme.getDefault().assets.icons;

  runComponentTest(
    fileName: 'impaktfull_ui_checkbox_list_item',
    columns: 2,
    goldenTests: () => [
      for (final value in [false, true]) ...[
        GoldenTest(
          child: goldenSized(ImpaktfullUiCheckboxListItem(
            title: 'Title',
            value: value,
            onChanged: (_) {},
          )),
        ),
        GoldenTest(
          child: goldenSized(ImpaktfullUiCheckboxListItem(
            title: 'Disabled',
            value: value,
            onChanged: null,
          )),
        ),
      ],
      GoldenTest(
        child: goldenSized(ImpaktfullUiCheckboxListItem(
          title: 'With subtitle and leading',
          subtitle: 'Subtitle',
          leading: icons.info,
          value: true,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiCheckboxListItem.indeterminate(
          title: 'Indeterminate',
          value: null,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiCheckboxListItem(
          title: 'A very long title that does not fit on a single line of the '
              'list item',
          subtitle: 'A very long subtitle that does not fit on a single line '
              'of the list item',
          value: false,
          onChanged: (_) {},
        )),
      ),
    ],
  );
}
