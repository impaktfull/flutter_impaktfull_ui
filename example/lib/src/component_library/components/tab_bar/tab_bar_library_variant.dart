import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/tab_bar/tab_bar_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/components/tab_bar/widget/tab_bar_controller_configurator.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class TabBarLibraryVariant extends ComponentLibraryVariant<TabBarLibraryPrimaryInputs> {
  const TabBarLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, TabBarLibraryPrimaryInputs inputs) {
    return [
      TabBarControllerConfigurator(
        builder: (context, controller, setState) => ImpaktfullUiTabBar(
          controller: controller,
          items: [
            ImpaktfullUiTabBarItem(
              label: 'Tab 1',
              index: 0,
              controller: controller,
            ),
            ImpaktfullUiTabBarItem(
              label: 'Tab 2',
              index: 1,
              controller: controller,
            ),
            ImpaktfullUiTabBarItem(
              label: 'Tab 3',
              index: 2,
              controller: controller,
            ),
          ],
        ),
      ),
    ];
  }

  @override
  TabBarLibraryPrimaryInputs inputs() => TabBarLibraryPrimaryInputs();
}

class TabBarLibraryPrimaryInputs extends TabBarLibraryInputs {}
