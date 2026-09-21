import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/color_picker/type/color_picker_slider.dart';

import '../../../util/test_util.dart';

void main() {
  test('defaultColors contains every color once', () {
    final colors = ImpaktfullUiColorPicker.defaultColors;
    expect(colors.toSet(), hasLength(colors.length));
  });

  testWidgets('the simple picker shows the hex value as tooltip',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiColorPicker(
        selectedColor: null,
        allowedColors: const [Color(0xFFF44336), Color(0x80123456)],
        onColorChanged: (_) {},
      ),
    );
    final tooltips = tester
        .widgetList<ImpaktfullUiTouchFeedback>(
            find.byType(ImpaktfullUiTouchFeedback))
        .map((touchFeedback) => touchFeedback.tooltip)
        .toList();
    expect(tooltips, ['#F44336', '#12345680']);
  });

  testWidgets('the simple picker calls onColorChangeEnd on tap',
      (tester) async {
    final changed = <Color>[];
    final ended = <Color>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiColorPicker(
        selectedColor: null,
        allowedColors: const [Color(0xFF123456)],
        onColorChanged: changed.add,
        onColorChangeEnd: ended.add,
      ),
    );
    await tester.tap(find.byType(ImpaktfullUiTouchFeedback));
    await tester.pump();
    expect(changed, [const Color(0xFF123456)]);
    expect(ended, [const Color(0xFF123456)]);
  });

  testWidgets('the slider picker calls onColorChangeEnd on release',
      (tester) async {
    final changed = <Color>[];
    final ended = <Color>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiColorPicker(
        type: ImpaktfullUiColorPickerType.slider,
        selectedColor: null,
        onColorChanged: changed.add,
        onColorChangeEnd: ended.add,
      ),
    );
    final gesture = await tester.startGesture(
        tester.getCenter(find.byType(ImpaktfullUiColorPickerSlider)));
    for (var i = 0; i < 5; i++) {
      await gesture.moveBy(const Offset(0, 5));
      await tester.pump();
    }
    expect(changed, isNotEmpty);
    expect(ended, isEmpty);

    await gesture.up();
    await tester.pump();
    expect(ended, [changed.last]);
  });
}
