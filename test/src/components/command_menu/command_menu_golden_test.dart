import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

Widget _window({
  String? value,
  bool hasBlurredBackground = false,
  bool withResults = true,
}) =>
    SizedBox(
      width: 600,
      height: 520,
      // Keep the blur of the background inside the golden of this scenario.
      child: ClipRect(
        child: Stack(
          children: [
            const Positioned.fill(
              child: Center(child: Text('Page content below the menu')),
            ),
            Positioned.fill(
              child: ImpaktfullUiCommandMenuWindow(
                value: value,
                hasBlurredBackground: hasBlurredBackground,
                onInputChanged: (_) {},
                onCloseWindow: () {},
                bottomBuilder: withResults
                    ? (context) => ListView(
                          children: const [
                            ListTile(title: Text('Open settings')),
                            ListTile(title: Text('Create project')),
                            ListTile(title: Text('Log out')),
                          ],
                        )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );

void main() {
  setUp(() => setupComponentTest());

  // One scenario per file: the input field of the window has autofocus.
  runComponentTest(
    fileName: 'impaktfull_ui_command_menu_empty',
    goldenTests: () => [
      GoldenTest(
        description: 'Empty',
        child: _window(withResults: false),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_command_menu_results',
    goldenTests: () => [
      GoldenTest(
        description: 'With a value and results',
        child: _window(value: 'settings'),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_command_menu_blurred',
    goldenTests: () => [
      GoldenTest(
        description: 'Blurred background',
        child: _window(value: 'settings', hasBlurredBackground: true),
      ),
    ],
  );
}
