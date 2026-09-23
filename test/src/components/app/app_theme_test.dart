import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  final light = ImpaktfullUiTheme.getDefault();
  final dark = ImpaktfullUiTheme.getDefaultDark();

  ImpaktfullUiTheme themeOf(WidgetTester tester) => ImpaktfullUiTheme.of(
        tester.element(find.byKey(const Key('home'))),
      );

  void setPlatformBrightness(WidgetTester tester, Brightness brightness) {
    tester.platformDispatcher.platformBrightnessTestValue = brightness;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
  }

  Future<void> pumpApp(
    WidgetTester tester, {
    ImpaktfullUiTheme? theme,
    ImpaktfullUiTheme? darkTheme,
    ImpaktfullUiThemeMode themeMode = ImpaktfullUiThemeMode.system,
  }) async {
    await tester.pumpWidget(ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      impaktfullUiTheme: theme,
      impaktfullUiDarkTheme: darkTheme,
      themeMode: themeMode,
      home: const SizedBox(key: Key('home')),
    ));
    await tester.pumpAndSettle();
  }

  group('light and dark theme', () {
    testWidgets('a dark platform brightness uses the dark theme',
        (tester) async {
      setPlatformBrightness(tester, Brightness.dark);
      await pumpApp(
        tester,
        theme: light,
        darkTheme: dark,
      );
      expect(themeOf(tester), same(dark));
    });

    testWidgets('a light platform brightness uses the light theme',
        (tester) async {
      setPlatformBrightness(tester, Brightness.light);
      await pumpApp(
        tester,
        theme: light,
        darkTheme: dark,
      );
      expect(themeOf(tester), same(light));
    });

    testWidgets('the app follows a change of the platform brightness',
        (tester) async {
      setPlatformBrightness(tester, Brightness.light);
      await pumpApp(
        tester,
        theme: light,
        darkTheme: dark,
      );
      expect(themeOf(tester), same(light));
      setPlatformBrightness(tester, Brightness.dark);
      await tester.pumpAndSettle();
      expect(themeOf(tester), same(dark));
    });

    // Like a MaterialApp without a darkTheme: the theme that is given wins.
    testWidgets('an explicit theme without a dark theme always wins',
        (tester) async {
      setPlatformBrightness(tester, Brightness.dark);
      await pumpApp(tester, theme: light);
      expect(themeOf(tester), same(light));
    });

    testWidgets('themeMode.light keeps the light theme on a dark platform',
        (tester) async {
      setPlatformBrightness(tester, Brightness.dark);
      await pumpApp(
        tester,
        theme: light,
        darkTheme: dark,
        themeMode: ImpaktfullUiThemeMode.light,
      );
      expect(themeOf(tester), same(light));
    });

    testWidgets('themeMode.dark uses the dark theme on a light platform',
        (tester) async {
      setPlatformBrightness(tester, Brightness.light);
      await pumpApp(
        tester,
        theme: light,
        darkTheme: dark,
        themeMode: ImpaktfullUiThemeMode.dark,
      );
      expect(themeOf(tester), same(dark));
    });

    testWidgets('themeMode.dark without a dark theme keeps the light theme',
        (tester) async {
      await pumpApp(
        tester,
        theme: light,
        themeMode: ImpaktfullUiThemeMode.dark,
      );
      expect(themeOf(tester), same(light));
    });

    testWidgets('the theme mode is passed to the MaterialApp', (tester) async {
      await pumpApp(
        tester,
        theme: light,
        themeMode: ImpaktfullUiThemeMode.dark,
      );
      expect(
        tester.widget<MaterialApp>(find.byType(MaterialApp)).themeMode,
        ThemeMode.dark,
      );
    });

    testWidgets('the default theme is used without a theme', (tester) async {
      setPlatformBrightness(tester, Brightness.dark);
      await pumpApp(tester);
      expect(themeOf(tester).label, 'impaktfull Theme');
    });
  });

  group('rebuilds', () {
    // A widget that reads a component theme, so it depends on the theme.
    Widget consumer(void Function() onBuild) => Builder(
          key: const Key('home'),
          builder: (context) {
            ImpaktfullUiComponentsTheme.of<ImpaktfullUiButtonTheme>(context);
            onBuild();
            return const SizedBox();
          },
        );

    /// Pumps an app that can be rebuilt without changing anything else, and
    /// returns how often [home] was built after one rebuild.
    Future<int> buildsAfterRebuild(
      WidgetTester tester,
      ImpaktfullUiTheme? Function() theme,
    ) async {
      var builds = 0;
      final home = consumer(() => builds++);
      late StateSetter rebuild;
      await tester.pumpWidget(StatefulBuilder(
        builder: (context, setState) {
          rebuild = setState;
          return ImpaktfullUiApp(
            title: 'app',
            showDebugFlag: false,
            impaktfullUiTheme: theme(),
            home: home,
          );
        },
      ));
      await tester.pumpAndSettle();
      expect(builds, 1);
      builds = 0;
      rebuild(() {});
      await tester.pumpAndSettle();
      return builds;
    }

    testWidgets('rebuilding the app does not rebuild the theme dependents',
        (tester) async {
      // Without a theme the app hands down the shared default theme, so the
      // theme does not change and nothing that reads it is rebuilt.
      expect(await buildsAfterRebuild(tester, () => null), 0);
    });

    testWidgets('rebuilding with the same theme does not rebuild them either',
        (tester) async {
      expect(await buildsAfterRebuild(tester, () => light), 0);
    });

    testWidgets('a new theme instance does rebuild them', (tester) async {
      // The control of the two tests above: a theme that is built again on
      // every build notifies every widget that reads it on every build.
      expect(
        await buildsAfterRebuild(tester, () => ImpaktfullUiTheme.getDefault()),
        1,
      );
    });
  });
}
