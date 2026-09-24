import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

// The building blocks read their theme from the widget tree, not from the
// deprecated global `theme`: they follow a theme override and rebuild when the
// theme changes.
void main() {
  const outerText = Color(0xFF654321);
  const innerText = Color(0xFF123456);
  final outerTheme = ImpaktfullUiTheme.custom(
    label: 'outer',
    primary: Colors.red,
    accent: Colors.green,
    secondary: Colors.blue,
    text: outerText,
  );
  final innerTheme = ImpaktfullUiTheme.custom(
    label: 'inner',
    primary: Colors.purple,
    accent: Colors.orange,
    secondary: Colors.teal,
    text: innerText,
  );

  final buildingBlocks = <String, (String, Widget Function())>{
    'ImpaktfullUiBBNotFound': (
      'Page not found',
      () => const ImpaktfullUiBBNotFound(),
    ),
    'ImpaktfullUiBBLogin': (
      'Welcome back!',
      () => ImpaktfullUiBBLogin(
            email: '',
            password: '',
            onEmailChanged: (_) {},
            onPasswordChanged: (_) {},
            onLoginTapped: () async {},
          ),
    ),
    'ImpaktfullUiBBRegister': (
      'Hi there!',
      () => ImpaktfullUiBBRegister(
            email: '',
            password: '',
            onEmailChanged: (_) {},
            onPasswordChanged: (_) {},
            onRegisterTapped: () async {},
          ),
    ),
    'ImpaktfullUiBBForgetPassword': (
      'Forgot password?',
      () => ImpaktfullUiBBForgetPassword(
            email: '',
            onEmailChanged: (_) {},
            onResetPasswordTapped: () async {},
          ),
    ),
    'ImpaktfullUiBBVerifyRegisterCode': (
      "You've got mail",
      () => ImpaktfullUiBBVerifyRegisterCode(
            code: '',
            onCodeChanged: (_) {},
            onVerifyCodeTapped: () async {},
          ),
    ),
  };

  Color? titleColor(WidgetTester tester, String title) =>
      tester.widget<Text>(find.text(title)).style?.color;

  for (final MapEntry(key: name, value: (title, builder))
      in buildingBlocks.entries) {
    group(name, () {
      testWidgets('uses the theme of a theme override', (tester) async {
        await tester.pumpWidget(
          ImpaktfullUiApp(
            showDebugFlag: false,
            title: 'test',
            impaktfullUiTheme: outerTheme,
            home: Row(
              children: [
                Expanded(child: builder()),
                Expanded(
                  child: ImpaktfullUiThemeConfigurator(
                    theme: innerTheme,
                    child: builder(),
                  ),
                ),
              ],
            ),
          ),
        );
        await tester.pumpAndSettle();
        final titles = tester.widgetList<Text>(find.text(title)).toList();
        expect(titles.map((text) => text.style?.color), [outerText, innerText]);
      });

      testWidgets('rebuilds when the theme changes', (tester) async {
        // The same widget instance: Flutter only rebuilds it because it
        // depends on the theme.
        final home = builder();
        Widget app(ImpaktfullUiTheme theme) => ImpaktfullUiApp(
              showDebugFlag: false,
              title: 'test',
              impaktfullUiTheme: theme,
              home: home,
            );
        await tester.pumpWidget(app(outerTheme));
        await tester.pumpAndSettle();
        expect(titleColor(tester, title), outerText);

        await tester.pumpWidget(app(innerTheme));
        await tester.pumpAndSettle();
        expect(titleColor(tester, title), innerText);
      });
    });
  }
}
