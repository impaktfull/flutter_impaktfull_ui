import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library.dart';
import 'package:impaktfull_ui_example/src/building_block_library/config/building_block_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/example_library/config/example_library.dart';
import 'package:impaktfull_ui_example/src/example_library/config/example_library_item.dart';
import 'package:impaktfull_ui_example/src/screen/building_blocks/building_block_library_item_screen.dart';
import 'package:impaktfull_ui_example/src/screen/building_blocks/building_block_library_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/component_library_item_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/component_library_screen.dart';
import 'package:impaktfull_ui_example/src/screen/examples/example_library_item_screen.dart';
import 'package:impaktfull_ui_example/src/screen/examples/example_library_screen.dart';
import 'package:impaktfull_ui_example/src/screen/home/home_screen.dart';
import 'package:impaktfull_ui_example/src/screen/settings/settings_screen.dart';
import 'package:impaktfull_ui_example/src/screen/styles/styles_library_item_screen.dart';
import 'package:impaktfull_ui_example/src/screen/styles/styles_library_screen.dart';
import 'package:impaktfull_ui_example/src/styles_library/config/styles_library.dart';
import 'package:impaktfull_ui_example/src/styles_library/config/styles_library_item.dart';

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
          builder: (_) => const ComponentLibraryScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case '/building-blocks':
        return ImpaktfullUiDesktopPageRoute<void>(
          builder: (_) => const BuildignBlockLibraryScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case '/examples':
        return ImpaktfullUiDesktopPageRoute<void>(
          builder: (_) => const ExampleLibraryScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
      case '/styles':
        return ImpaktfullUiDesktopPageRoute<void>(
          builder: (_) => const StylesLibraryScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
    }

    final components = ComponentLibrary.instance.items;
    for (final component in components) {
      if (name == '/components/${component.slug}') {
        return ImpaktfullUiDesktopPageRoute<void>(
          builder: (_) => ComponentLibraryItemScreen(
            item: component,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      }
    }

    final buildingBlocks = BuildingBlockLibrary.instance.items;
    for (final buildingBlock in buildingBlocks) {
      if (name == '/building-blocks/${buildingBlock.slug}') {
        return ImpaktfullUiDesktopPageRoute<void>(
          builder: (_) => BuildingBlockLibraryItemScreen(
            item: buildingBlock,
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
          builder: (_) => ExampleLibraryItemScreen(
            item: example,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      }
    }

    final styles = StylesLibrary.instance.items;
    for (final style in styles) {
      if (name == '/styles/${style.slug}') {
        return ImpaktfullUiDesktopPageRoute<void>(
          builder: (_) => StylesLibraryItemScreen(
            item: style,
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

  void goToBuildingBlocks() =>
      navigatorKey.currentState?.pushNamed('/building-blocks');

  void goToExamples() => navigatorKey.currentState?.pushNamed('/examples');

  void goToStyles() => navigatorKey.currentState?.pushNamed('/styles');

  void goToComponent(ComponentLibraryItem item) =>
      navigatorKey.currentState?.pushNamed('/components/${item.slug}');

  void goToBuildingBlock(BuildingBlockLibraryItem item) =>
      navigatorKey.currentState?.pushNamed('/building-blocks/${item.slug}');

  void goToExample(ExampleLibraryItem item) =>
      navigatorKey.currentState?.pushNamed('/examples/${item.slug}');

  void goToStyle(StylesLibraryItem item) =>
      navigatorKey.currentState?.pushNamed('/styles/${item.slug}');

  void goBack() => navigatorKey.currentState?.pop();
}
