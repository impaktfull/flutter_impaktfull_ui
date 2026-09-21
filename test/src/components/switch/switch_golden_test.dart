import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_switch',
    columns: 2,
    goldenTests: () => [
      for (final enabled in [true, false]) ...[
        for (final value in [false, true]) ...[
          GoldenTest(
            child: ImpaktfullUiSwitch(
              value: value,
              onChanged: enabled ? (_) {} : null,
            ),
          ),
        ],
      ],
      // The accessible icons are shown with accessible navigation
      for (final value in [false, true]) ...[
        GoldenTest(
          child: MediaQuery(
            data: const MediaQueryData(accessibleNavigation: true),
            child: ImpaktfullUiSwitch(value: value, onChanged: (_) {}),
          ),
        ),
      ],
    ],
  );
}
