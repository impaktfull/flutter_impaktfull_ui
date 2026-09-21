import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  Future<ImpaktfullUiDividerTheme> pump(
    WidgetTester tester,
    ImpaktfullUiDivider divider,
  ) async {
    await pumpAndSettleComponent(
      tester,
      Align(
        alignment: Alignment.topLeft,
        child: SizedBox(width: 200, height: 100, child: Center(child: divider)),
      ),
    );
    return ImpaktfullUiDividerTheme.of(
      tester.element(find.byType(ImpaktfullUiDivider)),
    );
  }

  testWidgets('horizontal takes the width and the theme thickness',
      (tester) async {
    final theme = await pump(tester, const ImpaktfullUiDivider());
    expect(
      tester.getSize(find.byType(ImpaktfullUiDivider)),
      Size(200, theme.dimens.thickness),
    );
  });

  testWidgets('vertical takes the height and the theme thickness',
      (tester) async {
    final theme = await pump(tester, const ImpaktfullUiDivider(vertical: true));
    expect(
      tester.getSize(find.byType(ImpaktfullUiDivider)),
      Size(theme.dimens.thickness, 100),
    );
  });

  testWidgets('uses the theme color', (tester) async {
    final theme = await pump(tester, const ImpaktfullUiDivider());
    final container = tester.widget<Container>(find.descendant(
      of: find.byType(ImpaktfullUiDivider),
      matching: find.byType(Container),
    ));
    expect((container.decoration as BoxDecoration?)?.color ?? container.color,
        theme.colors.color);
  });

  testWidgets('the margin is added around the line', (tester) async {
    final theme = await pump(
      tester,
      const ImpaktfullUiDivider(margin: EdgeInsets.symmetric(horizontal: 20)),
    );
    final line = tester.getRect(find.descendant(
      of: find.byType(ImpaktfullUiDivider),
      matching: find.byType(ColoredBox),
    ));
    expect(line.width, 200 - 40);
    expect(line.height, theme.dimens.thickness);
  });

  testWidgets('vertical margin is added around a vertical line',
      (tester) async {
    await pump(
      tester,
      const ImpaktfullUiDivider(
        vertical: true,
        margin: EdgeInsets.symmetric(vertical: 10),
      ),
    );
    final line = tester.getRect(find.descendant(
      of: find.byType(ImpaktfullUiDivider),
      matching: find.byType(ColoredBox),
    ));
    expect(line.height, 100 - 20);
  });
}
