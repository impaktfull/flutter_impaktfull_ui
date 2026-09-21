import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  final defaultTheme = ImpaktfullUiTheme.getDefault().components.badge;
  final theme = ImpaktfullUiBadgeTheme(
    assets: defaultTheme.assets,
    colors: defaultTheme.colors,
    dimens: defaultTheme.dimens,
    textStyles: ImpaktfullUiBadgeTextStylesTheme(
      small: defaultTheme.textStyles.small.copyWith(fontSize: 10),
      medium: defaultTheme.textStyles.medium.copyWith(fontSize: 20),
      large: defaultTheme.textStyles.large.copyWith(fontSize: 30),
    ),
  );

  final fontSizes = {
    ImpaktfullUiBadgeSize.small: 10.0,
    ImpaktfullUiBadgeSize.medium: 20.0,
    ImpaktfullUiBadgeSize.large: 30.0,
  };
  for (final MapEntry(key: size, value: fontSize) in fontSizes.entries) {
    testWidgets('$size uses its own text style', (tester) async {
      await pumpAndSettleComponent(
        tester,
        Center(
          child: ImpaktfullUiBadge(
            type: ImpaktfullUiBadgeType.primary,
            label: 'Label',
            size: size,
            theme: theme,
          ),
        ),
      );
      final text = tester.widget<Text>(find.text('Label'));
      expect(text.style?.fontSize, fontSize);
    });
  }
}
