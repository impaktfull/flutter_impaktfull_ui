import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

/// Shared helpers for the tests of the pickers & overlays components.

/// Pumps an [ImpaktfullUiApp] with [home] and returns a context below the
/// navigator of the app (to show modals, bottom sheets, ...).
Future<BuildContext> pumpOverlayApp(
  WidgetTester tester, {
  Widget? home,
  SnackyController? snackyController,
}) async {
  late BuildContext appContext;
  await tester.pumpWidget(
    ImpaktfullUiApp(
      showDebugFlag: false,
      title: 'test',
      snackyController: snackyController,
      home: Builder(
        builder: (context) {
          appContext = context;
          return home ?? const SizedBox.expand();
        },
      ),
    ),
  );
  await tester.pumpAndSettle();
  return appContext;
}

/// Sets the size of the test view and resets it at the end of the test.
void setOverlayTestViewSize(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

/// Taps [finder] and waits until all animations are done.
Future<void> tapAndSettle(WidgetTester tester, Finder finder) async {
  await tester.tap(finder);
  await tester.pumpAndSettle();
}
