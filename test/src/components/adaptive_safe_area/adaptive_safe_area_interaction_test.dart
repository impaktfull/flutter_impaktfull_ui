import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/screen_size_util.dart';

void main() {
  const safeArea = EdgeInsets.fromLTRB(10, 20, 30, 40);

  Future<Rect> pumpSafeArea(
    WidgetTester tester,
    ImpaktfullUiAdaptiveSafeArea Function(Widget child) builder, {
    TextDirection textDirection = TextDirection.ltr,
  }) async {
    setScreenSize(tester, const Size(400, 800));
    await tester.pumpWidget(
      Directionality(
        textDirection: textDirection,
        child: MediaQuery(
          data: const MediaQueryData(
            size: Size(400, 800),
            padding: safeArea,
          ),
          child: builder(const SizedBox.expand(key: Key('child'))),
        ),
      ),
    );
    return tester.getRect(find.byKey(const Key('child')));
  }

  testWidgets('applies every side of the safe area', (tester) async {
    final rect = await pumpSafeArea(
      tester,
      (child) => ImpaktfullUiAdaptiveSafeArea(child: child),
    );
    expect(rect, const Rect.fromLTRB(10, 20, 400 - 30, 800 - 40));
  });

  testWidgets('can disable every side', (tester) async {
    final rect = await pumpSafeArea(
      tester,
      (child) => ImpaktfullUiAdaptiveSafeArea(
        top: false,
        bottom: false,
        start: false,
        end: false,
        child: child,
      ),
    );
    expect(rect, const Rect.fromLTRB(0, 0, 400, 800));
  });

  testWidgets('start and end follow the text direction (ltr)', (tester) async {
    final rect = await pumpSafeArea(
      tester,
      (child) => ImpaktfullUiAdaptiveSafeArea(
        top: false,
        bottom: false,
        end: false,
        child: child,
      ),
    );
    // Start is left.
    expect(rect, const Rect.fromLTRB(10, 0, 400, 800));
  });

  testWidgets('start and end follow the text direction (rtl)', (tester) async {
    final rect = await pumpSafeArea(
      tester,
      (child) => ImpaktfullUiAdaptiveSafeArea(
        top: false,
        bottom: false,
        end: false,
        child: child,
      ),
      textDirection: TextDirection.rtl,
    );
    // Start is right.
    expect(rect, const Rect.fromLTRB(0, 0, 400 - 30, 800));
  });

  testWidgets('adds the macOS menu bar height without a menu bar',
      (tester) async {
    final rect = await pumpSafeArea(
      tester,
      (child) => ImpaktfullUiAdaptiveSafeArea(
        hasMacOsMenuBar: false,
        child: child,
      ),
    );
    // The host platform decides (flutter test runs on the host).
    final menuBar = Platform.isMacOS ? 22.0 : 0.0;
    expect(rect.top, 20 + menuBar);
    expect(rect.bottom, 800 - 40);
  });
}
