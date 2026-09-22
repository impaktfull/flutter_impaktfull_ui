import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_overlays_golden_helpers.dart';

Widget _tooltip({
  required String? message,
  ImpaktfullUiTooltipTriggerMode triggerMode =
      ImpaktfullUiTooltipTriggerMode.tap,
}) =>
    SizedBox(
      width: 300,
      height: 140,
      child: Center(
        child: ImpaktfullUiTooltip(
          message: message,
          triggerMode: triggerMode,
          child: const SizedBox(
            width: 120,
            height: 40,
            child: ColoredBox(
              color: Color(0xFFE0E0E0),
              child: Center(child: Text('Target')),
            ),
          ),
        ),
      ),
    );

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_tooltip_closed',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'With message',
        child: _tooltip(message: 'Tooltip message'),
      ),
      GoldenTest(
        description: 'Without message',
        child: _tooltip(message: null),
      ),
    ],
  );

  runOverlayGoldenTest(
    fileName: 'impaktfull_ui_tooltip_open',
    size: const Size(300, 140),
    builder: () => _tooltip(message: 'Tooltip message'),
    whilePerforming: tapAndSettleInteraction(find.text('Target')),
  );

  runOverlayGoldenTest(
    fileName: 'impaktfull_ui_tooltip_open_multiline',
    size: const Size(300, 140),
    builder: () => _tooltip(
      message: 'A longer tooltip message\nover multiple lines',
    ),
    whilePerforming: tapAndSettleInteraction(find.text('Target')),
  );
}
