import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/theme/theme_configurator.dart';

const _focusedAccent = Color(0xFF00FF00);
const _otherAccent = Color(0xFFFF0000);

ImpaktfullUiTheme _theme(Color accent) => ImpaktfullUiTheme.custom(
      primary: const Color(0xFF1A1A1A),
      accent: accent,
      secondary: const Color(0xFF7d64f2),
    );

Future<void> _pump(WidgetTester tester, {bool useFocusColor = true}) async {
  await tester.pumpWidget(
    ImpaktfullUiApp(
      showDebugFlag: false,
      title: 'test',
      home: Column(
        children: [
          ImpaktfullUiThemeConfigurator(
            theme: _theme(_focusedAccent),
            child: ImpaktfullUiTouchFeedback(
              onTap: () {},
              useFocusColor: useFocusColor,
              child: const SizedBox(width: 100, height: 40),
            ),
          ),
          // Built later: the global theme getter now returns this theme.
          ImpaktfullUiThemeConfigurator(
            theme: _theme(_otherAccent),
            child: const SizedBox(),
          ),
        ],
      ),
    ),
  );
  await tester.pumpAndSettle();
}

Color? _focusRingColor(WidgetTester tester) {
  final container = tester.widget<Container>(
    find.descendant(
      of: find.byType(ImpaktfullUiFocusFeedback),
      matching: find.byType(Container),
    ),
  );
  final decoration = container.decoration as BoxDecoration;
  return (decoration.border as Border).top.color;
}

void main() {
  testWidgets('shows the focus ring with the theme of the context',
      (tester) async {
    await _pump(tester);
    expect(
      find.descendant(
        of: find.byType(ImpaktfullUiFocusFeedback),
        matching: find.byType(Container),
      ),
      findsOneWidget,
    );
    expect(_focusRingColor(tester), Colors.transparent);

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pumpAndSettle();

    final feedback = tester.widget<ImpaktfullUiFocusFeedback>(
      find.byType(ImpaktfullUiFocusFeedback),
    );
    expect(feedback.hasFocus, isTrue);
    final color = _focusRingColor(tester);
    expect(color, isNot(Colors.transparent));
    expect(color!.r, _focusedAccent.r);
    expect(color.g, _focusedAccent.g);
    expect(color.b, _focusedAccent.b);
  });

  testWidgets('no focus ring when useFocusColor is false', (tester) async {
    await _pump(tester, useFocusColor: false);
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pumpAndSettle();

    expect(
      find.descendant(
        of: find.byType(ImpaktfullUiFocusFeedback),
        matching: find.byType(Container),
      ),
      findsNothing,
    );
  });
}
