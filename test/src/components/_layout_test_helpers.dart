import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../util/golden_test_variant.dart';
import '../../util/screen_size_util.dart';

/// Screen sizes used to render the responsive components.
const smallScreenSize = Size(400, 700);
const mediumScreenSize = Size(1100, 700);
const largeScreenSize = Size(1600, 700);

/// A golden case with a [label] above the [child].
///
/// With a [size], the [child] is rendered in a box of that size and sees that
/// size as the screen size (`MediaQuery.sizeOf`), so responsive components
/// pick the layout of that size.
GoldenTest layoutGoldenCase(
  String label,
  Widget child, {
  Size? size,
  double? width,
}) =>
    GoldenTest(
      description: label,
      child: Builder(
        builder: (context) => ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Text(
              label,
              style: ImpaktfullUiTheme.of(context)
                  .textStyles
                  .onCanvas
                  .text
                  .small
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            if (size != null) ...[
              screenSized(size, child),
            ] else if (width != null) ...[
              SizedBox(width: width, child: child),
            ] else ...[
              child,
            ],
          ],
        ),
      ),
    );

/// Renders [child] in a box of [size] that reports [size] as screen size.
Widget screenSized(Size size, Widget child) => Builder(
      builder: (context) => SizedBox.fromSize(
        size: size,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(size: size),
          child: child,
        ),
      ),
    );

/// Pumps [widget] as the home of an [ImpaktfullUiApp] on a screen of [size]
/// and waits for the animations to settle.
Future<void> pumpLayoutApp(
  WidgetTester tester,
  Widget widget, {
  Size size = smallScreenSize,
}) async {
  setScreenSize(tester, size);
  await tester.pumpWidget(ImpaktfullUiApp(
    showDebugFlag: false,
    title: 'impaktfull app',
    home: Material(child: widget),
  ));
  await tester.pumpAndSettle();
}

/// A test icon asset.
const testAsset = ImpaktfullUiAsset.icon(Icons.home);
const testSelectedAsset = ImpaktfullUiAsset.icon(Icons.home_filled);
