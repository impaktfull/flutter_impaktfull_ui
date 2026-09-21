import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  const colors = [Colors.red, Colors.orange, Colors.green];

  List<Color?> indicatorColors(WidgetTester tester) => tester
      .widgetList<AnimatedContainer>(find.byType(AnimatedContainer))
      .map((container) => (container.decoration as BoxDecoration?)?.color)
      .toList();

  Widget buildSut(int? index) => ImpaktfullUiPasswordStrengthIndicator(
        strengthIndicatorIndex: index,
        strengthIndicators: colors,
        requirements: const [],
      );

  testWidgets('index equal to the number of indicators does not throw',
      (tester) async {
    await pumpAndSettleComponent(tester, buildSut(colors.length));
    expect(tester.takeException(), isNull);
    expect(indicatorColors(tester), [Colors.green, Colors.green, Colors.green]);
  });

  testWidgets('index larger than the number of indicators is clamped',
      (tester) async {
    await pumpAndSettleComponent(tester, buildSut(10));
    expect(tester.takeException(), isNull);
    expect(indicatorColors(tester), [Colors.green, Colors.green, Colors.green]);
  });

  testWidgets('negative index colors no indicator', (tester) async {
    await pumpAndSettleComponent(tester, buildSut(-1));
    expect(tester.takeException(), isNull);
    expect(indicatorColors(tester), isNot(contains(Colors.red)));
  });

  testWidgets('index in range colors the indicators up to the index',
      (tester) async {
    await pumpAndSettleComponent(tester, buildSut(1));
    final result = indicatorColors(tester);
    expect(result[0], Colors.orange);
    expect(result[1], Colors.orange);
    expect(result[2], isNot(Colors.orange));
  });
}
