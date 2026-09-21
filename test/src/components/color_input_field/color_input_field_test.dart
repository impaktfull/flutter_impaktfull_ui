import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/color_picker/type/color_picker_slider.dart';

import '../../../util/test_util.dart';

void main() {
  group('alphaEnabled', () {
    testWidgets('parses RRGGBBAA', (tester) async {
      final colors = <Color>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiColorInputField(
          alphaEnabled: true,
          onChanged: colors.add,
        ),
      );
      await tester.enterText(find.byType(TextField), '#FF000080');
      await tester.pumpAndSettle();
      expect(colors, isNotEmpty);
      expect(colors.last, const Color(0x80FF0000));
    });

    testWidgets('parses RRGGBB as an opaque color', (tester) async {
      final colors = <Color>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiColorInputField(
          alphaEnabled: true,
          onChanged: colors.add,
        ),
      );
      await tester.enterText(find.byType(TextField), '#00FF00');
      await tester.pumpAndSettle();
      expect(colors.last, const Color(0xFF00FF00));
    });

    testWidgets('shows the alpha of the initial color', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiColorInputField(
          alphaEnabled: true,
          initialColor: const Color(0x80FF0000),
          onChanged: (_) {},
        ),
      );
      expect(find.text('#ff000080'), findsOneWidget);
    });
  });

  testWidgets('without alphaEnabled the alpha is not shown', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiColorInputField(
        initialColor: const Color(0x80FF0000),
        onChanged: (_) {},
      ),
    );
    expect(find.text('#ff0000'), findsOneWidget);
  });

  testWidgets('invalid hex characters are ignored', (tester) async {
    final colors = <Color>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiColorInputField(onChanged: colors.add),
    );
    await tester.enterText(find.byType(TextField), '#-1-1-1');
    await tester.pumpAndSettle();
    expect(colors, isEmpty);
  });

  testWidgets('the slider dialog stays open while dragging', (tester) async {
    final colors = <Color>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiColorInputField(
        colorPickerType: ImpaktfullUiColorPickerType.slider,
        onChanged: colors.add,
      ),
    );
    await tester.tap(find
        .descendant(
          of: find.byType(ImpaktfullUiColorInputField),
          matching: find.byType(ImpaktfullUiTouchFeedback),
        )
        .first);
    await tester.pumpAndSettle();
    expect(find.byType(ImpaktfullUiColorPickerSlider), findsOneWidget);

    final gesture = await tester.startGesture(
        tester.getCenter(find.byType(ImpaktfullUiColorPickerSlider)));
    for (var i = 0; i < 5; i++) {
      await gesture.moveBy(const Offset(0, 5));
      await tester.pump();
    }
    await tester.pumpAndSettle();
    expect(find.byType(ImpaktfullUiColorPickerSlider), findsOneWidget);
    expect(colors, isEmpty);

    await gesture.up();
    await tester.pumpAndSettle();
    expect(find.byType(ImpaktfullUiColorPickerSlider), findsNothing);
    expect(colors, hasLength(1));
  });

  testWidgets('the simple dialog closes after tapping a color', (tester) async {
    final colors = <Color>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiColorInputField(
        colorPickerType: ImpaktfullUiColorPickerType.simple,
        colorPickerColors: const [Color(0xFF123456)],
        onChanged: colors.add,
      ),
    );
    await tester.tap(find
        .descendant(
          of: find.byType(ImpaktfullUiColorInputField),
          matching: find.byType(ImpaktfullUiTouchFeedback),
        )
        .first);
    await tester.pumpAndSettle();
    await tester.tap(find
        .descendant(
          of: find.byType(ImpaktfullUiColorPicker),
          matching: find.byType(ImpaktfullUiTouchFeedback),
        )
        .first);
    await tester.pumpAndSettle();
    expect(find.byType(ImpaktfullUiColorPicker), findsNothing);
    expect(colors, [const Color(0xFF123456)]);
  });
}
