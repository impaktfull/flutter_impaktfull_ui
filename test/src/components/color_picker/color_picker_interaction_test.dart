import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/color_picker/type/color_picker_slider.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  Finder swatches() => find.descendant(
        of: find.byType(ImpaktfullUiColorPicker),
        matching: find.byType(ImpaktfullUiTouchFeedback),
      );

  Widget wrap(Widget child) =>
      Center(child: SizedBox(width: 300, child: child));

  /// Drags vertically on the slider from [startFraction] to [endFraction] of
  /// its height.
  Future<void> dragSlider(
    WidgetTester tester,
    double startFraction,
    double endFraction,
  ) async {
    final slider = find.byType(ImpaktfullUiColorPickerSlider);
    final topLeft = tester.getTopLeft(slider);
    final size = tester.getSize(slider);
    final start = topLeft + Offset(size.width / 2, size.height * startFraction);
    final gesture = await tester.startGesture(start);
    final steps = 10;
    final delta = size.height * (endFraction - startFraction) / steps;
    for (var i = 0; i < steps; i++) {
      await gesture.moveBy(Offset(0, delta));
      await tester.pump();
    }
    await gesture.up();
    await tester.pump();
  }

  group('simple', () {
    testWidgets('the default colors are used without allowedColors',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiColorPicker(
          selectedColor: null,
          onChanged: (_) {},
        )),
      );
      expect(
        tester
            .widgetList<ImpaktfullUiTouchFeedback>(swatches())
            .map((swatch) => swatch.color)
            .toList(),
        ImpaktfullUiColorPicker.defaultColors,
      );
    });

    testWidgets('tapping a color emits that color', (tester) async {
      final colors = <Color>[];
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiColorPicker(
          selectedColor: null,
          allowedColors: const [Colors.black, Colors.white, Colors.teal],
          onChanged: colors.add,
        )),
      );
      await tester.tap(swatches().at(2));
      await tester.pump();
      await tester.tap(swatches().at(0));
      await tester.pump();
      expect(colors, [Colors.teal, Colors.black]);
    });

    testWidgets('showActiveColor shows the selected color', (tester) async {
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiColorPicker(
          selectedColor: customTestColor,
          showActiveColor: true,
          onChanged: (_) {},
        )),
      );
      expect(
        find.byWidgetPredicate((widget) =>
            widget is Container &&
            (widget.decoration as BoxDecoration?)?.color == customTestColor),
        findsOneWidget,
      );
    });

    testWidgets('a new selected color from the parent is shown',
        (tester) async {
      final selected = ValueNotifier<Color?>(null);
      await pumpAndSettleComponent(
        tester,
        wrap(ValueListenableBuilder<Color?>(
          valueListenable: selected,
          builder: (context, value, child) => ImpaktfullUiColorPicker(
            selectedColor: value,
            showActiveColor: true,
            onChanged: (color) => selected.value = color,
          ),
        )),
      );
      Finder activeColor(Color color) => find.byWidgetPredicate((widget) =>
          widget is Container &&
          (widget.decoration as BoxDecoration?)?.color == color);
      await tester.tap(swatches().at(1));
      await tester.pumpAndSettle();
      expect(activeColor(ImpaktfullUiColorPicker.defaultColors[1]),
          findsOneWidget);
      selected.value = customTestColor;
      await tester.pumpAndSettle();
      expect(activeColor(customTestColor), findsOneWidget);
    });

    testWidgets('the theme override is used', (tester) async {
      final theme = defaultComponentsTheme.colorPicker;
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiColorPicker(
          selectedColor: null,
          allowedColors: const [Colors.black],
          onChanged: (_) {},
          theme: theme.copyWith(
            dimens: theme.dimens.copyWith(simpleColorPickerItemSize: 50),
          ),
        )),
      );
      expect(tester.getSize(swatches()), const Size(50, 50));
    });
  });

  group('slider', () {
    testWidgets('dragging at the top picks red', (tester) async {
      final colors = <Color>[];
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiColorPicker(
          type: ImpaktfullUiColorPickerType.slider,
          selectedColor: null,
          onChanged: colors.add,
        )),
      );
      await dragSlider(tester, 0.2, 0.01);
      expect(colors, isNotEmpty);
      final hue = HSVColor.fromColor(colors.last).hue;
      expect(hue, lessThan(10));
    });

    testWidgets('dragging in the middle picks cyan', (tester) async {
      final colors = <Color>[];
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiColorPicker(
          type: ImpaktfullUiColorPickerType.slider,
          selectedColor: null,
          onChanged: colors.add,
        )),
      );
      await dragSlider(tester, 0.3, 0.5);
      final hue = HSVColor.fromColor(colors.last).hue;
      expect(hue, closeTo(180, 2));
    });

    testWidgets('dragging outside the slider does not emit', (tester) async {
      final colors = <Color>[];
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiColorPicker(
          type: ImpaktfullUiColorPickerType.slider,
          selectedColor: null,
          onChanged: colors.add,
        )),
      );
      await dragSlider(tester, 0.5, 1.5);
      final count = colors.length;
      final slider = find.byType(ImpaktfullUiColorPickerSlider);
      final gesture = await tester
          .startGesture(tester.getBottomLeft(slider) + const Offset(10, -1));
      await gesture.moveBy(const Offset(0, 100));
      await tester.pump();
      await gesture.moveBy(const Offset(0, 100));
      await tester.pump();
      await gesture.up();
      expect(colors.length, count);
      expect(colors.every((color) => HSVColor.fromColor(color).hue <= 360),
          isTrue);
    });

    testWidgets('a tap without a drag does not call onChangeEnd',
        (tester) async {
      final ended = <Color>[];
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiColorPicker(
          type: ImpaktfullUiColorPickerType.slider,
          selectedColor: null,
          onChanged: (_) {},
          onChangeEnd: ended.add,
        )),
      );
      await tester.tap(find.byType(ImpaktfullUiColorPickerSlider));
      await tester.pump();
      expect(ended, isEmpty);
    });

    group(
      'allowedColors',
      () {
        testWidgets('the picked color is one of the gradient colors',
            (tester) async {
          final colors = <Color>[];
          await pumpAndSettleComponent(
            tester,
            wrap(ImpaktfullUiColorPicker(
              type: ImpaktfullUiColorPickerType.slider,
              selectedColor: null,
              allowedColors: const [Colors.black, Colors.white],
              onChanged: colors.add,
            )),
          );
          await dragSlider(tester, 0.2, 0.01);
          // The top of a black to white gradient is black
          final hsv = HSVColor.fromColor(colors.last);
          expect(hsv.value, lessThan(0.1));
        });
      },
    );
  });
}
