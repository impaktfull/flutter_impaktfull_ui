import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
  );
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
  );

  MaterialApp findMaterialApp(WidgetTester tester) =>
      tester.widget<MaterialApp>(find.byType(MaterialApp));

  testWidgets('darkTheme is built from materialDarkTheme', (tester) async {
    await tester.pumpWidget(ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      materialLightTheme: lightTheme,
      materialDarkTheme: darkTheme,
      home: const SizedBox(),
    ));

    final app = findMaterialApp(tester);
    expect(app.theme!.brightness, Brightness.light);
    expect(app.theme!.primaryColor, Colors.red);
    expect(app.darkTheme!.brightness, Brightness.dark);
    expect(app.darkTheme!.primaryColor, Colors.blue);
  });

  testWidgets('darkTheme falls back to materialLightTheme', (tester) async {
    await tester.pumpWidget(ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      materialLightTheme: lightTheme,
      home: const SizedBox(),
    ));

    final app = findMaterialApp(tester);
    expect(app.darkTheme!.brightness, Brightness.light);
    expect(app.darkTheme!.primaryColor, Colors.red);
  });
}
