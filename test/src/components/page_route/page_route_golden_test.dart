import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_overlays_golden_helpers.dart';

Widget _page(String title, Color color) => Material(
      color: color,
      child: Center(child: Text(title)),
    );

void main() {
  setUp(() => setupComponentTest());

  // The desktop route has no transition: one frame after the push the new
  // page is shown completely (no half faded or moved page).
  runOverlayGoldenTest(
    fileName: 'impaktfull_ui_desktop_page_route',
    size: const Size(300, 200),
    builder: () => _page('First page', Colors.amber),
    whilePerforming: (tester) async {
      unawaited(
        Navigator.of(tester.element(find.text('First page'))).push(
          ImpaktfullUiDesktopPageRoute<void>(
            builder: (context) => _page('Second page', Colors.lightBlue),
          ),
        ),
      );
      await tester.pump();
      return null;
    },
  );
}
