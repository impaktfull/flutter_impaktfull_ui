import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/theme/theme_configurator.dart';

const _highlight = Color(0x0FFFFFFF);
const _hover = Color(0x0AFFFFFF);
const _focus = Color(0x14FFFFFF);
const _splash = Color(0x1FFFFFFF);

ImpaktfullUiTheme _theme({ImpaktfullUiTouchFeedbackColorTheme? colors}) {
  final theme = ImpaktfullUiTheme.getDefault();
  if (colors == null) return theme;
  return theme.copyWith(
    components: theme.components.copyWith(
      touchFeedback: theme.components.touchFeedback.copyWith(colors: colors),
    ),
  );
}

Future<void> _pump(
  WidgetTester tester, {
  required ImpaktfullUiTheme theme,
  ImpaktfullUiTouchFeedbackTheme? componentTheme,
  bool useFocusColor = true,
}) async {
  await tester.pumpWidget(
    ImpaktfullUiApp(
      showDebugFlag: false,
      title: 'test',
      home: ImpaktfullUiThemeConfigurator(
        theme: theme,
        child: Center(
          child: ImpaktfullUiTouchFeedback(
            onTap: () {},
            useFocusColor: useFocusColor,
            theme: componentTheme,
            child: const SizedBox(width: 100, height: 40),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

InkWell _inkWell(WidgetTester tester) => tester.widget<InkWell>(
      find.descendant(
        of: find.byType(ImpaktfullUiTouchFeedback),
        matching: find.byType(InkWell),
      ),
    );

void main() {
  test('the default theme keeps the colors of the Material theme', () {
    final colors =
        ImpaktfullUiTheme.getDefault().components.touchFeedback.colors;
    expect(colors.highlight, isNull);
    expect(colors.hover, isNull);
    expect(colors.focus, isNull);
    expect(colors.splash, isNull);
  });

  testWidgets('without colors the InkWell uses the Material theme',
      (tester) async {
    await _pump(tester, theme: _theme());
    final inkWell = _inkWell(tester);
    expect(inkWell.highlightColor, isNull);
    expect(inkWell.hoverColor, isNull);
    expect(inkWell.splashColor, isNull);
    final context = tester.element(find.byType(InkWell));
    expect(inkWell.focusColor, Theme.of(context).hoverColor);
  });

  testWidgets('uses the colors of the touch feedback theme', (tester) async {
    await _pump(
      tester,
      theme: _theme(
        colors: const ImpaktfullUiTouchFeedbackColorTheme(
          highlight: _highlight,
          hover: _hover,
          focus: _focus,
          splash: _splash,
        ),
      ),
    );
    final inkWell = _inkWell(tester);
    expect(inkWell.highlightColor, _highlight);
    expect(inkWell.hoverColor, _hover);
    expect(inkWell.focusColor, _focus);
    expect(inkWell.splashColor, _splash);
  });

  testWidgets('the theme of the instance wins over the global theme',
      (tester) async {
    await _pump(
      tester,
      theme: _theme(
        colors: const ImpaktfullUiTouchFeedbackColorTheme(highlight: _splash),
      ),
      componentTheme: const ImpaktfullUiTouchFeedbackTheme(
        colors: ImpaktfullUiTouchFeedbackColorTheme(highlight: _highlight),
      ),
    );
    expect(_inkWell(tester).highlightColor, _highlight);
  });

  testWidgets('useFocusColor false hides the focus color of the theme',
      (tester) async {
    await _pump(
      tester,
      theme: _theme(
        colors: const ImpaktfullUiTouchFeedbackColorTheme(focus: _focus),
      ),
      useFocusColor: false,
    );
    expect(_inkWell(tester).focusColor, Colors.transparent);
  });

  test('copyWith changes one color and keeps the others', () {
    const colors = ImpaktfullUiTouchFeedbackColorTheme(
      highlight: _highlight,
      hover: _hover,
    );
    final changed = colors.copyWith(hover: _focus);
    expect(changed.highlight, _highlight);
    expect(changed.hover, _focus);
    expect(
        ImpaktfullUiTouchFeedbackTheme.fallback
            .copyWith(colors: changed)
            .colors,
        changed);
  });
}
