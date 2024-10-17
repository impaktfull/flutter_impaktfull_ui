import 'package:flutter/material.dart';
import 'package:impaktfull_ui_example/src/navigator/page_route/native_page_route_builder.dart';
import 'package:impaktfull_ui_example/src/screen/components/components_library_screen.dart';
import 'package:impaktfull_ui_example/src/screen/home/home_screen.dart';

class ImpaktfullUiNavigator {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
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

    return null;
  }
}
