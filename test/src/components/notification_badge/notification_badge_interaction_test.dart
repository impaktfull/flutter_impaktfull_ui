import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  final badgeTheme =
      ImpaktfullUiTheme.getDefault().components.notificationBadge;

  double opacity(WidgetTester tester) => tester
      .widget<AnimatedOpacity>(find.descendant(
        of: find.byType(ImpaktfullUiNotificationBadge),
        matching: find.byType(AnimatedOpacity),
      ))
      .opacity;

  Positioned positioned(WidgetTester tester) =>
      tester.widget<Positioned>(find.descendant(
        of: find.byType(ImpaktfullUiNotificationBadge),
        matching: find.byType(Positioned),
      ));

  testWidgets('show animates in and out when the parent changes it',
      (tester) async {
    var show = false;
    late StateSetter setState;
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return Center(
            child: ImpaktfullUiNotificationBadge(
              show: show,
              text: '1',
              color: null,
              child: const SizedBox(width: 24, height: 24),
            ),
          );
        },
      ),
    );
    expect(opacity(tester), 0);

    setState(() => show = true);
    await tester.pump();
    await tester.pump(badgeTheme.durations.opacity ~/ 2);
    final fadeTransition = tester.widget<FadeTransition>(find.descendant(
      of: find.byType(AnimatedOpacity),
      matching: find.byType(FadeTransition),
    ));
    expect(fadeTransition.opacity.value, greaterThan(0));
    expect(fadeTransition.opacity.value, lessThan(1));
    await tester.pumpAndSettle();
    expect(opacity(tester), 1);
  });

  testWidgets('the child can still be tapped', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiNotificationBadge(
          show: true,
          color: null,
          child: GestureDetector(
            key: const ValueKey('child'),
            behavior: HitTestBehavior.opaque,
            onTap: () => taps++,
            child: const SizedBox(width: 48, height: 48),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const ValueKey('child')));
    expect(taps, 1);
  });

  testWidgets('a custom color replaces the color of the theme', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiNotificationBadge(
          show: true,
          text: '1',
          color: Colors.green,
          child: SizedBox(width: 24, height: 24),
        ),
      ),
    );
    final decoration = tester
        .widget<Container>(find
            .descendant(
              of: find.byType(Transform),
              matching: find.byType(Container),
            )
            .first)
        .decoration as BoxDecoration;
    expect(decoration.color, Colors.green);
  });

  for (final location in ImpaktfullUiNotificationBadgeLocation.values) {
    testWidgets('$location: the dot is positioned on that corner',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        Center(
          child: ImpaktfullUiNotificationBadge(
            show: true,
            color: null,
            location: location,
            child: const SizedBox(width: 24, height: 24),
          ),
        ),
      );
      final position = positioned(tester);
      const offset = -ImpaktfullUiNotificationBadge.dotSize / 2;
      final isTop = location.alignment.y < 0;
      final isLeft = location.alignment.x < 0;
      expect(position.top, isTop ? offset : null);
      expect(position.bottom, isTop ? null : offset);
      expect(position.left, isLeft ? offset : null);
      expect(position.right, isLeft ? null : offset);
    });
  }

  testWidgets('a longer text moves the badge further out', (tester) async {
    Future<double> right(String text) async {
      await pumpAndSettleComponent(
        tester,
        Center(
          child: ImpaktfullUiNotificationBadge(
            show: true,
            text: text,
            color: null,
            child: const SizedBox(width: 24, height: 24),
          ),
        ),
      );
      return positioned(tester).right!;
    }

    expect(await right('999'), lessThan(await right('1')));
  });
}
