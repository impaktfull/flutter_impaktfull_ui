import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_layout_test_helpers.dart';

// The builder per width and the helpers at every boundary are tested in
// responsive_layout_test.dart.
void main() {
  testWidgets('switches the builder when the screen is resized',
      (tester) async {
    final widget = ImpaktfullUiResponsiveLayout(
      small: (context) => const Text('small'),
      medium: (context) => const Text('medium'),
      large: (context) => const Text('large'),
    );
    await pumpLayoutApp(tester, widget);
    expect(find.text('small'), findsOneWidget);

    tester.view.physicalSize = mediumScreenSize;
    await tester.pumpAndSettle();
    expect(find.text('medium'), findsOneWidget);

    tester.view.physicalSize = largeScreenSize;
    await tester.pumpAndSettle();
    expect(find.text('large'), findsOneWidget);

    tester.view.physicalSize = smallScreenSize;
    await tester.pumpAndSettle();
    expect(find.text('small'), findsOneWidget);
  });

  final fallbackCases = <String, ({Size size, String expected})>{
    'extra large without extraLarge uses large': (
      size: const Size(2000, 800),
      expected: 'large',
    ),
    'large without large uses medium': (
      size: largeScreenSize,
      expected: 'medium',
    ),
  };
  for (final entry in fallbackCases.entries) {
    testWidgets(entry.key, (tester) async {
      final withLarge = entry.value.expected == 'large';
      await pumpLayoutApp(
        tester,
        ImpaktfullUiResponsiveLayout(
          small: (context) => const Text('small'),
          medium: (context) => const Text('medium'),
          large: withLarge ? (context) => const Text('large') : null,
        ),
        size: entry.value.size,
      );
      expect(find.text(entry.value.expected), findsOneWidget);
    });
  }

  testWidgets('only small is used at every width', (tester) async {
    for (final size in [
      smallScreenSize,
      mediumScreenSize,
      largeScreenSize,
      const Size(2000, 800),
    ]) {
      await pumpLayoutApp(
        tester,
        ImpaktfullUiResponsiveLayout(small: (context) => const Text('small')),
        size: size,
      );
      expect(find.text('small'), findsOneWidget, reason: '$size');
    }
  });

  testWidgets('uses the screen width, not the available width', (tester) async {
    await pumpLayoutApp(
      tester,
      Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 200,
          child: ImpaktfullUiResponsiveLayout(
            small: (context) => const Text('small'),
            large: (context) => const Text('large'),
          ),
        ),
      ),
      size: largeScreenSize,
    );
    expect(find.text('large'), findsOneWidget);
  });
}
