import 'package:flutter/material.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/navigator/page_route/native_page_route_builder.dart';
import 'package:impaktfull_ui_example/src/screen/components/components_library_item_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/components_library_screen.dart';
import 'package:impaktfull_ui_example/src/screen/home/home_screen.dart';

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
        return NativePageRoute<void>(
          builder: (_) => const HomeScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case '/components':
        return NativePageRoute<void>(
          builder: (_) => const ComponentsLibraryScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
    }

    final components = ComponentLibrary.instance.components;
    for (final component in components) {
      if (name == '/components/${component.slug}') {
        return NativePageRoute<void>(
          builder: (_) => ComponentsLibraryItemScreen(
            item: component,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      }
    }

    return null;
  }

  void goToHome() => navigatorKey.currentState?.pushNamed('/');

  void goToComponents() => navigatorKey.currentState?.pushNamed('/components');

  void goToComponent(ComponentLibraryItem item) =>
      navigatorKey.currentState?.pushNamed('/components/${item.slug}');

  void goBack() => navigatorKey.currentState?.pop();
}
