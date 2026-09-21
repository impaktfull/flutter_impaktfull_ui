import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('uses the end radii of the input field theme', (tester) async {
    const borderRadius = BorderRadiusDirectional.only(
      topStart: Radius.circular(1),
      topEnd: Radius.circular(2),
      bottomStart: Radius.circular(3),
      bottomEnd: Radius.circular(4),
    );
    await pumpAndSettleComponent(
      tester,
      Builder(
        builder: (context) {
          final theme = ImpaktfullUiInputFieldTheme.of(context);
          return ImpaktfullUiInputFieldAction(
            label: 'Action',
            onTap: () {},
            theme: ImpaktfullUiInputFieldTheme(
              assets: theme.assets,
              colors: theme.colors,
              textStyles: theme.textStyles,
              dimens: ImpaktfullUiInputFieldDimensTheme(
                borderRadius: borderRadius,
                labelMargin: theme.dimens.labelMargin,
              ),
            ),
          );
        },
      ),
    );
    final card = tester.widget<ImpaktfullUiCard>(find.byType(ImpaktfullUiCard));
    expect(
      card.borderRadius,
      const BorderRadiusDirectional.only(
        topEnd: Radius.circular(2),
        bottomEnd: Radius.circular(4),
      ),
    );
  });
}
