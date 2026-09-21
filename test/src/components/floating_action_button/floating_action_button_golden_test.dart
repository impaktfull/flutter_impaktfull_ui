import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  final icons = ImpaktfullUiTheme.getDefault().assets.icons;

  runComponentTest(
    fileName: 'impaktfull_ui_floating_action_button',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        child: Center(
          child: ImpaktfullUiFloatingActionButton(
            asset: icons.add,
            onTap: () {},
          ),
        ),
      ),
      GoldenTest(
        child: Center(
          child: ImpaktfullUiFloatingActionButton(
            asset: icons.add,
          ),
        ),
      ),
      GoldenTest(
        child: Center(
          child: ImpaktfullUiFloatingActionButton(
            asset: icons.add,
            label: 'Collapsed',
            onTap: () {},
          ),
        ),
      ),
      GoldenTest(
        child: Center(
          child: ImpaktfullUiFloatingActionButton(
            asset: icons.add,
            label: 'Add item',
            expanded: true,
            onTap: () {},
          ),
        ),
      ),
      GoldenTest(
        child: Center(
          child: ImpaktfullUiFloatingActionButton(
            asset: icons.edit,
            label: 'Disabled',
            expanded: true,
          ),
        ),
      ),
      GoldenTest(
        child: Center(
          child: ImpaktfullUiFloatingActionButton(
            asset: icons.edit,
            label: 'A very long label for a floating action button',
            expanded: true,
            onTap: () {},
          ),
        ),
      ),
    ],
  );
}
