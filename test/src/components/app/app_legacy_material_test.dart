// The point of these tests is a page that still uses the deprecated
// `package:flutter/material.dart`.
// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart' as legacy;
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:material_ui/material_ui.dart';

/// impaktfull_ui is built on `package:material_ui`. An app, or a package it
/// uses, may still build its pages with `package:flutter/material.dart`,
/// whose `Theme`, `Material` and `MaterialLocalizations` are other types.
/// `ImpaktfullUiApp` bridges them, so those pages keep working.
void main() {
  Future<void> pumpApp(
    WidgetTester tester,
    Widget home, {
    ThemeData? materialLightTheme,
  }) async {
    await tester.pumpWidget(ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      materialLightTheme: materialLightTheme,
      home: home,
    ));
    await tester.pumpAndSettle();
  }

  testWidgets('a legacy text field finds the material localizations',
      (tester) async {
    await pumpApp(
      tester,
      const legacy.Material(
        child: legacy.TextField(key: Key('field')),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(find.byKey(const Key('field')), findsOneWidget);
    final context = tester.element(find.byKey(const Key('field')));
    expect(legacy.MaterialLocalizations.of(context), isNotNull);
  });

  testWidgets('a legacy page reads the colours of the material theme',
      (tester) async {
    const seed = Color(0xFF0E7C66);
    final materialTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: seed),
    );
    await pumpApp(
      tester,
      const SizedBox(key: Key('home')),
      materialLightTheme: materialTheme,
    );
    final context = tester.element(find.byKey(const Key('home')));
    expect(
      legacy.Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.primary,
    );
    expect(
      legacy.Theme.of(context).colorScheme.primary,
      materialTheme.colorScheme.primary,
    );
  });

  testWidgets('a legacy scaffold with a button renders and can be tapped',
      (tester) async {
    var tapped = 0;
    await pumpApp(
      tester,
      legacy.Scaffold(
        body: Center(
          child: legacy.ElevatedButton(
            onPressed: () => tapped++,
            child: const Text('Legacy'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Legacy'));
    await tester.pump();
    expect(tapped, 1);
    expect(tester.takeException(), isNull);
  });
}
