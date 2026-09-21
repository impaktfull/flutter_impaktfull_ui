// Runs on the Dart VM and in Chrome (tool/test_web.sh).

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

Future<InteractiveInkFeatureFactory?> _splashFactory(
  WidgetTester tester,
  TargetPlatform platform,
) async {
  debugDefaultTargetPlatformOverride = platform;
  try {
    await pumpComponent(
      tester,
      ImpaktfullUiTouchFeedback(
        onTap: () {},
        child: const SizedBox(width: 40, height: 40),
      ),
    );
    return tester.widget<InkWell>(find.byType(InkWell)).splashFactory;
  } finally {
    debugDefaultTargetPlatformOverride = null;
  }
}

void main() {
  testWidgets('android uses InkSparkle, except on the web', (tester) async {
    // InkSparkle loads a fragment shader, which the web does not support
    // reliably (ThemeData makes the same choice)
    expect(
      await _splashFactory(tester, TargetPlatform.android),
      kIsWeb ? InkRipple.splashFactory : InkSparkle.splashFactory,
    );
  });
}
