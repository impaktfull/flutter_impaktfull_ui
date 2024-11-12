import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/nav_bar/nav_bar_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/items/tab_bar/widget/tab_bar_controller_configurator.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class NavBarLibraryVariant
    extends ComponentLibraryVariant<NavBarLibraryPrimaryInputs> {
  const NavBarLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, NavBarLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiNavBar(
        title: inputs.title.value ?? '',
        subtitle: inputs.subtitle.value ?? '',
        onBackTapped: () => ImpaktfullUiNotification.show(title: 'Go back!'),
        isFullScreen: inputs.isFullScreen.value ?? false,
        actions: [
          ImpaktfullUiIconButton(
            onTap: () => ImpaktfullUiNotification.show(title: 'Add'),
            asset: theme.assets.icons.add,
          ),
        ],
      ),
      ImpaktfullUiNavBar(
        title: inputs.title.value ?? '',
        subtitle: inputs.subtitle.value ?? '',
        onBackTapped: () => ImpaktfullUiNotification.show(title: 'Go back!'),
        isFullScreen: inputs.isFullScreen.value ?? false,
        actions: [
          ImpaktfullUiIconButton(
            onTap: () => ImpaktfullUiNotification.show(
              title: 'Confetti for everyone!',
              type: ImpaktfullUiNotificationType.branded,
            ),
            asset: theme.assets.icons.confetti,
            color: theme.colors.accent,
          ),
          ImpaktfullUiIconButton(
            onTap: () => ImpaktfullUiNotification.show(title: 'Edit'),
            asset: theme.assets.icons.edit,
          ),
          ImpaktfullUiIconButton(
            onTap: () => ImpaktfullUiNotification.show(title: 'Add'),
            asset: theme.assets.icons.add,
          ),
        ],
      ),
      ImpaktfullUiNavBar(
        title: inputs.title.value ?? '',
        subtitle: inputs.subtitle.value ?? '',
        onBackTapped: () => ImpaktfullUiNotification.show(title: 'Go back!'),
        isFullScreen: inputs.isFullScreen.value ?? false,
        bottomChild: TabBarControllerConfigurator(
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
      ),
    ];
  }

  @override
  NavBarLibraryPrimaryInputs inputs() => NavBarLibraryPrimaryInputs();
}

class NavBarLibraryPrimaryInputs extends NavBarLibraryInputs {}
