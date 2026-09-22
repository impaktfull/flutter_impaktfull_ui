import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

// The theme ImpaktfullUiApp uses when it gets none.
final _theme = ImpaktfullUiTheme.getDefault();

void main() {
  setUp(() => setupComponentTest());

  Widget box(String label, {double? width, double? height}) => Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        color: _theme.colors.border,
        child: Text(label),
      );

  Widget layout({Alignment alignment = Alignment.center, bool all = false}) =>
      ImpaktfullUiUnifiedScreenLayout(
        alignment: alignment,
        topBuilder: all ? (context) => box('top') : null,
        bottomBuilder: all ? (context) => box('bottom') : null,
        startBuilder: all ? (context) => box('start', width: 60) : null,
        endBuilder: all ? (context) => box('end', width: 60) : null,
        centerChild: Container(
          height: 60,
          color: _theme.colors.accent,
          alignment: Alignment.center,
          child: const Text('center'),
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_unified_screen_layout',
    columns: 3,
    goldenTests: () => [
      for (final entry in {
        'top': Alignment.topCenter,
        'center': Alignment.center,
        'bottom': Alignment.bottomCenter,
      }.entries)
        layoutGoldenCase(
          'Aligned ${entry.key} (small)',
          layout(alignment: entry.value),
          size: const Size(300, 300),
        ),
      layoutGoldenCase(
        'Top, bottom, start and end (small)',
        layout(all: true),
        size: const Size(300, 300),
      ),
      layoutGoldenCase(
        'Center (medium)',
        layout(),
        size: Size(mediumScreenSize.width, 300),
      ),
      layoutGoldenCase(
        'Center (large)',
        layout(),
        size: Size(largeScreenSize.width, 300),
      ),
    ],
  );
}
