import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/tab_bar/widget/tab_bar_controller_configurator.dart';
import 'package:impaktfull_ui_example/src/component_library/items/tab_bar_item/tab_bar_item_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class TabBarItemLibraryVariant
    extends ComponentLibraryVariant<TabBarItemLibraryPrimaryInputs> {
  const TabBarItemLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, TabBarItemLibraryPrimaryInputs inputs) {
    return [
      TabBarControllerConfigurator(
        builder: (context, controller, setState) => ImpaktfullUiTabBarItem(
          controller: controller,
          label: 'Tab 1',
          index: 0,
        ),
      ),
    ];
  }

  @override
  TabBarItemLibraryPrimaryInputs inputs() => TabBarItemLibraryPrimaryInputs();
}

class TabBarItemLibraryPrimaryInputs extends TabBarItemLibraryInputs {}
