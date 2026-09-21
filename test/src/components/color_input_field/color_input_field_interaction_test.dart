import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  String shownText(WidgetTester tester) =>
      tester.widget<TextField>(find.byType(TextField)).controller!.text;

  /// The touch feedback that shows the selected color.
  Finder swatch() => find
      .descendant(
        of: find.byType(ImpaktfullUiColorInputField),
        matching: find.byType(ImpaktfullUiTouchFeedback),
      )
      .first;

  Color? swatchColor(WidgetTester tester) =>
      tester.widget<ImpaktfullUiTouchFeedback>(swatch()).color;

  group('typing', () {
    testWidgets('a RRGGBB value calls onChanged and updates the swatch',
        (tester) async {
      final colors = <Color>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiColorInputField(onChanged: colors.add),
      );
      await tester.enterText(find.byType(TextField), '#123456');
      await tester.pumpAndSettle();
      expect(colors, [const Color(0xFF123456)]);
      expect(swatchColor(tester), const Color(0xFF123456));
    });

    testWidgets('the short RGB notation is parsed', (tester) async {
      final colors = <Color>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiColorInputField(onChanged: colors.add),
      );
      await tester.enterText(find.byType(TextField), 'f0a');
      await tester.pumpAndSettle();
      expect(colors, [const Color(0xFFFF00AA)]);
    });

    testWidgets('a # is added in front of the value', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiColorInputField(onChanged: (_) {}),
      );
      await tester.enterText(find.byType(TextField), 'abc');
      await tester.pumpAndSettle();
      expect(shownText(tester), '#abc');
    });

    testWidgets('a value longer than RRGGBB is truncated', (tester) async {
      final colors = <Color>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiColorInputField(onChanged: colors.add),
      );
      await tester.enterText(find.byType(TextField), '#11223344');
      await tester.pumpAndSettle();
      expect(shownText(tester), '#112233');
      expect(colors.last, const Color(0xFF112233));
    });

    testWidgets('an incomplete value does not call onChanged', (tester) async {
      final colors = <Color>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiColorInputField(
          initialColor: Colors.red,
          onChanged: colors.add,
        ),
      );
      await tester.enterText(find.byType(TextField), '#12');
      await tester.pumpAndSettle();
      expect(colors, isEmpty);
      expect(swatchColor(tester), Colors.transparent);
    });
  });

  testWidgets('without onChanged the field is disabled', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiColorInputField(initialColor: Color(0xFF123456)),
    );
    expect(find.byType(TextField), findsNothing);
    expect(find.text('#123456'), findsOneWidget);
  });

  testWidgets('without colorPickerType the swatch can not be tapped',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiColorInputField(onChanged: (_) {}),
    );
    expect(tester.widget<ImpaktfullUiTouchFeedback>(swatch()).onTap, isNull);
  });

  testWidgets('picking a color in the simple picker updates the field',
      (tester) async {
    final colors = <Color>[];
    const picked = Color(0xFF00AA00);
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiColorInputField(
        colorPickerType: ImpaktfullUiColorPickerType.simple,
        colorPickerColors: const [picked],
        onChanged: colors.add,
      ),
    );
    await tester.tap(swatch());
    await tester.pumpAndSettle();
    expect(find.byType(ImpaktfullUiColorPicker), findsOneWidget);
    await tester.tap(find.descendant(
      of: find.byType(ImpaktfullUiColorPicker),
      matching: find.byType(ImpaktfullUiTouchFeedback),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(ImpaktfullUiColorPicker), findsNothing);
    expect(colors, [picked]);
    expect(shownText(tester), '#00aa00');
    expect(swatchColor(tester), picked);
  });

  testWidgets('the label is shown', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiColorInputField(label: 'Color', onChanged: (_) {}),
    );
    expect(find.text('Color'), findsOneWidget);
  });

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.colorInputField;
    final borderRadius = BorderRadius.circular(3);
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiColorInputField(
        onChanged: (_) {},
        theme: theme.copyWith(
          colors: theme.colors.copyWith(border: customTestColor),
          dimens: theme.dimens.copyWith(borderRadius: borderRadius),
        ),
      ),
    );
    final touchFeedback = tester.widget<ImpaktfullUiTouchFeedback>(swatch());
    expect((touchFeedback.border as Border?)?.top.color, customTestColor);
    expect(touchFeedback.borderRadius, borderRadius);
  });
}
