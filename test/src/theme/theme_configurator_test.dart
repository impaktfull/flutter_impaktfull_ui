import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/theme/theme_configurator.dart';
import 'package:impaktfull_ui/src/theme/theme_configurator.dart'
    as configurator;

// The theme and locale of theme_configurator.dart are global. Every test file
// runs in its own isolate, so this file starts without a theme or locale. The
// tests depend on their order.
void main() {
  test('theme and locale throw before they are set', () {
    expect(() => configurator.theme, throwsException);
    expect(() => configurator.locale, throwsException);
  });

  test('setImpaktfullUiTheme sets the theme', () {
    final theme = ImpaktfullUiTheme.custom(
      primary: Colors.red,
      accent: Colors.green,
      secondary: Colors.blue,
    );
    setImpaktfullUiTheme(theme);
    expect(configurator.theme, same(theme));
  });

  test('setImpaktfullUiTheme(null) falls back to the default theme', () {
    setImpaktfullUiTheme(null);
    expect(configurator.theme.label, 'impaktfull Theme');
  });

  test('the test theme wins and can not be replaced by setImpaktfullUiTheme',
      () {
    final testTheme = ImpaktfullUiTheme.custom(
      label: 'test',
      primary: Colors.red,
      accent: Colors.green,
      secondary: Colors.blue,
    );
    setImpaktfullUiTestTheme(testTheme);
    addTearDown(() => setImpaktfullUiTestTheme(null));

    setImpaktfullUiTheme(ImpaktfullUiTheme.getDefault());
    expect(configurator.theme, same(testTheme));
  });

  test('setImpaktfullUiLocale sets the locale, null falls back to en', () {
    setImpaktfullUiLocale(const Locale('nl'));
    expect(configurator.locale, const Locale('nl'));
    setImpaktfullUiLocale(null);
    expect(configurator.locale, const Locale('en'));
  });

  testWidgets('ImpaktfullUiApp sets the global theme and locale',
      (tester) async {
    final theme = ImpaktfullUiTheme.custom(
      label: 'app',
      primary: Colors.red,
      accent: Colors.green,
      secondary: Colors.blue,
    );
    await tester.pumpWidget(
      ImpaktfullUiApp(
        showDebugFlag: false,
        title: 'test',
        impaktfullUiTheme: theme,
        locale: const Locale('en', 'US'),
        supportedLocales: const [Locale('en', 'US')],
        home: const SizedBox(),
      ),
    );
    expect(configurator.theme, same(theme));
    expect(configurator.locale, const Locale('en', 'US'));
  });

  testWidgets('ImpaktfullUiThemeConfigurator updates the global theme',
      (tester) async {
    final first = ImpaktfullUiTheme.getDefault();
    final second = ImpaktfullUiTheme.custom(
      primary: Colors.red,
      accent: Colors.green,
      secondary: Colors.blue,
    );
    await tester.pumpWidget(
        ImpaktfullUiThemeConfigurator(theme: first, child: const SizedBox()));
    expect(configurator.theme, same(first));
    await tester.pumpWidget(
        ImpaktfullUiThemeConfigurator(theme: second, child: const SizedBox()));
    expect(configurator.theme, same(second));
  });
}
