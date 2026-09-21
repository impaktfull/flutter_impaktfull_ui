import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_overlays_test_helpers.dart';

late SnackyController _controller;

Widget _app({double width = 400}) {
  _controller = SnackyController();
  return ImpaktfullUiApp(
    showDebugFlag: false,
    title: 'snacky',
    snackyController: _controller,
    home: SizedBox(
      width: width,
      height: 180,
      child: const ColoredBox(color: Color(0xFFF5F5F5)),
    ),
  );
}

Interaction _show(Snacky snacky) => (tester) async {
      _controller.showMessage((context) => snacky);
      await tester.pumpAndSettle();
      return null;
    };

void main() {
  setUp(() => setupComponentTest());

  runOverlayGoldenTest(
    fileName: 'impaktfull_ui_snacky_mobile',
    size: const Size(400, 180),
    builder: _app,
    whilePerforming: _show(
      const Snacky(
        title: 'Saved',
        subtitle: 'Your changes are saved',
        type: SnackyType.success,
        canBeClosed: true,
        openUntillClosed: true,
      ),
    ),
  );

  runOverlayGoldenTest(
    fileName: 'impaktfull_ui_snacky_tablet',
    size: const Size(700, 180),
    builder: () => _app(width: 700),
    whilePerforming: _show(
      const Snacky(
        title: 'Something went wrong',
        type: SnackyType.error,
        openUntillClosed: true,
      ),
    ),
  );
}
