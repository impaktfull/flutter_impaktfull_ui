import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

// The theme ImpaktfullUiApp uses when it gets none.
final _theme = ImpaktfullUiTheme.getDefault();

/// The status bar only sets the system overlay style: the golden checks that
/// the child is rendered unchanged.
void main() {
  setUp(() => setupComponentTest());

  Widget child(Color color) => Container(
        width: 120,
        height: 40,
        color: color,
        alignment: Alignment.center,
        child: const Text('child'),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_status_bar',
    columns: 3,
    goldenTests: () => [
      layoutGoldenCase(
        'Dark',
        ImpaktfullUiStatusBar.dark(child: child(Colors.white)),
      ),
      layoutGoldenCase(
        'Light',
        ImpaktfullUiStatusBar.light(child: child(Colors.grey)),
      ),
      layoutGoldenCase(
        'On background color',
        ImpaktfullUiStatusBar.onBackgroundColor(
          backgroundColor: _theme.colors.accent,
          child: child(_theme.colors.accent),
        ),
      ),
    ],
  );
}
