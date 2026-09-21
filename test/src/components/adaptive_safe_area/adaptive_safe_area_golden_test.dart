import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  /// A screen with a safe area of 10 (left), 20 (top), 30 (right) and 40
  /// (bottom). The safe content is the accent color.
  Widget withSafeArea(
    ImpaktfullUiAdaptiveSafeArea Function(Widget child) builder,
  ) =>
      Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            padding: const EdgeInsets.fromLTRB(10, 20, 30, 40),
          ),
          child: SizedBox(
            width: 150,
            height: 150,
            child: ColoredBox(
              color: theme.colors.border,
              child: builder(ColoredBox(color: theme.colors.accent)),
            ),
          ),
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_adaptive_safe_area',
    columns: 4,
    goldenTests: () => [
      layoutGoldenCase(
        'All sides',
        withSafeArea((child) => ImpaktfullUiAdaptiveSafeArea(child: child)),
      ),
      layoutGoldenCase(
        'Without top/bottom',
        withSafeArea((child) => ImpaktfullUiAdaptiveSafeArea(
              top: false,
              bottom: false,
              child: child,
            )),
      ),
      layoutGoldenCase(
        'Start only',
        withSafeArea((child) => ImpaktfullUiAdaptiveSafeArea(
              top: false,
              bottom: false,
              end: false,
              child: child,
            )),
      ),
      layoutGoldenCase(
        'Start only (rtl)',
        Directionality(
          textDirection: TextDirection.rtl,
          child: withSafeArea((child) => ImpaktfullUiAdaptiveSafeArea(
                top: false,
                bottom: false,
                end: false,
                child: child,
              )),
        ),
      ),
    ],
  );
}
