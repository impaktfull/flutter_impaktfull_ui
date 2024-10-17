import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/examples_library/config/example_library.dart';
import 'package:impaktfull_ui_example/src/examples_library/config/example_library_item.dart';
import 'package:impaktfull_ui_example/src/screen/components/components_library_item_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/components_library_screen.dart';
import 'package:impaktfull_ui_example/src/screen/examples_library/examples_library_item_screen.dart';
import 'package:impaktfull_ui_example/src/screen/examples_library/examples_library_screen.dart';
import 'package:impaktfull_ui_example/src/screen/home/home_screen.dart';
import 'package:impaktfull_ui_example/src/screen/settings/settings_screen.dart';

class ImpaktfullUiNavigator {
  final navigatorKey = GlobalKey<NavigatorState>();

  static ImpaktfullUiNavigator? _instance;

  String get initialRoute => '/';

  ImpaktfullUiNavigator._();

  static ImpaktfullUiNavigator get instance =>
      _instance ??= ImpaktfullUiNavigator._();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final name = settings.name;
    switch (name) {
      case '/':
        return ImpaktfullUiDesktopPageRoute<void>(
          builder: (_) => const HomeScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case '/settings':
        return ImpaktfullUiDesktopPageRoute<void>(
          builder: (_) => const SettingsScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case '/components':
        return ImpaktfullUiDesktopPageRoute<void>(
          builder: (_) => const ComponentsLibraryScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case '/examples':
        return ImpaktfullUiDesktopPageRoute<void>(
          builder: (_) => const ExamplesLibraryScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
    }

    final components = ComponentLibrary.instance.components;
    for (final component in components) {
      if (name == '/components/${component.slug}') {
        return ImpaktfullUiDesktopPageRoute<void>(
          builder: (_) => ComponentsLibraryItemScreen(
            item: component,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      }
    }

    final examples = ExampleLibrary.instance.examples;
    for (final example in examples) {
      if (name == '/examples/${example.slug}') {
        return ImpaktfullUiDesktopPageRoute<void>(
          builder: (_) => ExamplesLibraryItemScreen(
            item: example,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      }
    }

    return null;
  }

  void goToHome() => navigatorKey.currentState?.pushNamed('/');

  void goToSettings() => navigatorKey.currentState?.pushNamed('/settings');

  void goToComponents() => navigatorKey.currentState?.pushNamed('/components');

  void goToExamples() => navigatorKey.currentState?.pushNamed('/examples');

  void goToComponent(ComponentLibraryItem item) =>
      navigatorKey.currentState?.pushNamed('/components/${item.slug}');

  void goToExample(ExampleLibraryItem item) =>
      navigatorKey.currentState?.pushNamed('/examples/${item.slug}');

  void goBack() => navigatorKey.currentState?.pop();
}
