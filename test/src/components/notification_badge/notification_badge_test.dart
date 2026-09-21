import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  double opacity(WidgetTester tester) => tester
      .widget<AnimatedOpacity>(find.descendant(
        of: find.byType(ImpaktfullUiNotificationBadge),
        matching: find.byType(AnimatedOpacity),
      ))
      .opacity;

  testWidgets('show: false hides a badge with a text', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiNotificationBadge(
          show: false,
          text: '3',
          color: null,
          child: SizedBox(width: 24, height: 24),
        ),
      ),
    );
    expect(opacity(tester), 0);
  });

  testWidgets('show: true shows a badge with a text', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiNotificationBadge(
          show: true,
          text: '3',
          color: null,
          child: SizedBox(width: 24, height: 24),
        ),
      ),
    );
    expect(opacity(tester), 1);
  });

  testWidgets('the badge text of an icon button is still shown by default',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiIconButton(
          asset: const ImpaktfullUiAsset.icon(IconData(0xe000)),
          notificationBadgeText: '3',
          onTap: () {},
        ),
      ),
    );
    expect(opacity(tester), 1);
  });

  testWidgets('the position takes the text scale into account', (tester) async {
    Future<double> right(double textScale) async {
      await pumpAndSettleComponent(
        tester,
        Builder(
          builder: (context) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(textScale),
            ),
            child: const Center(
              child: ImpaktfullUiNotificationBadge(
                show: true,
                text: '123',
                color: null,
                child: SizedBox(width: 24, height: 24),
              ),
            ),
          ),
        ),
      );
      return tester
          .widget<Positioned>(find.descendant(
            of: find.byType(ImpaktfullUiNotificationBadge),
            matching: find.byType(Positioned),
          ))
          .right!;
    }

    final normal = await right(1);
    final large = await right(2);
    expect(large, lessThan(normal));
  });
}
