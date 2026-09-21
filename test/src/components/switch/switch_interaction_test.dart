import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  Color? backgroundColor(WidgetTester tester) => tester
      .widget<ImpaktfullUiTouchFeedback>(find.byType(ImpaktfullUiTouchFeedback))
      .color;

  for (final value in [false, true]) {
    testWidgets('tapping a switch with $value emits ${!value}', (tester) async {
      final values = <bool>[];
      await pumpAndSettleComponent(
        tester,
        Center(child: ImpaktfullUiSwitch(value: value, onChanged: values.add)),
      );
      await tester.tap(find.byType(ImpaktfullUiSwitch));
      await tester.pump();
      expect(values, [!value]);
    });
  }

  testWidgets('a disabled switch does not emit and is transparent',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(child: ImpaktfullUiSwitch(value: false, onChanged: null)),
    );
    await tester.tap(find.byType(ImpaktfullUiSwitch), warnIfMissed: false);
    await tester.pump();
    expect(tester.takeException(), isNull);
    expect(
        tester
            .widget<Opacity>(find.descendant(
              of: find.byType(ImpaktfullUiSwitch),
              matching: find.byType(Opacity),
            ))
            .opacity,
        0.5);
  });

  testWidgets('a controlled switch follows the value of the parent',
      (tester) async {
    final theme = defaultComponentsTheme.switchTheme;
    final value = ValueNotifier(false);
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ValueListenableBuilder<bool>(
          valueListenable: value,
          builder: (context, current, child) => ImpaktfullUiSwitch(
            value: current,
            onChanged: (newValue) => value.value = newValue,
          ),
        ),
      ),
    );
    expect(backgroundColor(tester), theme.colors.inactiveBackground);
    await tester.tap(find.byType(ImpaktfullUiSwitch));
    await tester.pumpAndSettle();
    expect(value.value, isTrue);
    expect(backgroundColor(tester), theme.colors.activeBackground);
    value.value = false;
    await tester.pumpAndSettle();
    expect(backgroundColor(tester), theme.colors.inactiveBackground);
  });

  testWidgets('the thumb moves to the end when active', (tester) async {
    final value = ValueNotifier(false);
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ValueListenableBuilder<bool>(
          valueListenable: value,
          builder: (context, current, child) =>
              ImpaktfullUiSwitch(value: current, onChanged: (_) {}),
        ),
      ),
    );
    Offset thumbPosition() => tester.getTopLeft(find
        .descendant(
          of: find.byType(AnimatedPadding),
          matching: find.byType(AnimatedContainer),
        )
        .first);
    final inactive = thumbPosition();
    value.value = true;
    await tester.pumpAndSettle();
    expect(thumbPosition().dx, greaterThan(inactive.dx));
  });

  for (final key in [LogicalKeyboardKey.space, LogicalKeyboardKey.enter]) {
    testWidgets('${key.debugName} toggles the focused switch', (tester) async {
      final values = <bool>[];
      await pumpAndSettleComponent(
        tester,
        Center(child: ImpaktfullUiSwitch(value: false, onChanged: values.add)),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      await tester.sendKeyEvent(key);
      await tester.pump();
      expect(values, [true]);
    });
  }

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.switchTheme;
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiSwitch(
          value: true,
          onChanged: (_) {},
          theme: theme.copyWith(
            colors: theme.colors.copyWith(activeBackground: customTestColor),
            assets: theme.assets.copyWith(active: customTestAsset),
          ),
        ),
      ),
    );
    expect(backgroundColor(tester), customTestColor);
    expect(
        find.byWidgetPredicate(isAssetWidget(customTestAsset)), findsOneWidget);
  });
}
