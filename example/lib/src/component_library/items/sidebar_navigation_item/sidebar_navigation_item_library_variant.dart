import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/sidebar_navigation_item/sidebar_navigation_item_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class SidebarNavigationItemLibraryVariant
    extends ComponentLibraryVariant<SidebarNavigationItemLibraryPrimaryInputs> {
  const SidebarNavigationItemLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, SidebarNavigationItemLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiSidebarNavigationItem(
        leading: theme.assets.icons.home,
        title: 'Home',
        isSelected: inputs.selectedPage.value == 0,
        onTap: () {
          inputs.selectedPage.updateState(0);
          ImpaktfullUiNotification.show(title: 'Home tapped');
        },
        items: [
          ImpaktfullUiSidebarNavigationItem(
            leading: theme.assets.icons.list,
            title: 'List',
            isSelected: inputs.selectedPage.value == 1,
            onTap: () {
              inputs.selectedPage.updateState(1);
              ImpaktfullUiNotification.show(title: 'List tapped');
            },
          ),
          ImpaktfullUiSidebarNavigationItem(
            leading: theme.assets.icons.search,
            title: 'Search',
            isSelected: inputs.selectedPage.value == 2,
            onTap: () {
              inputs.selectedPage.updateState(2);
              ImpaktfullUiNotification.show(title: 'Search tapped');
            },
          ),
        ],
      ),
      ComponentsLibraryVariantDescriptor(
        wrapWithCard: true,
        child: ImpaktfullUiSidebarNavigationItem(
          leading: theme.assets.icons.home,
          title: 'Home',
          isSelected: inputs.selectedPage.value == 0,
          items: [
            ImpaktfullUiSidebarNavigationItem(
              leading: theme.assets.icons.list,
              title: 'List',
              isSelected: inputs.selectedPage.value == 1,
              onTap: () {
                inputs.selectedPage.updateState(1);
                ImpaktfullUiNotification.show(title: 'List tapped');
              },
            ),
            ImpaktfullUiSidebarNavigationItem(
              leading: theme.assets.icons.search,
              title: 'Search',
              isSelected: inputs.selectedPage.value == 2,
              items: [
                ImpaktfullUiSidebarNavigationItem(
                  leading: theme.assets.icons.list,
                  title: 'List',
                  isSelected: inputs.selectedPage.value == 3,
                  onTap: () {
                    inputs.selectedPage.updateState(3);
                    ImpaktfullUiNotification.show(title: 'List tapped');
                  },
                ),
                ImpaktfullUiSidebarNavigationItem(
                  leading: theme.assets.icons.search,
                  title: 'Search',
                  isSelected: inputs.selectedPage.value == 4,
                  onTap: () {
                    inputs.selectedPage.updateState(4);
                    ImpaktfullUiNotification.show(title: 'Search tapped');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ];
  }

  @override
  SidebarNavigationItemLibraryPrimaryInputs inputs() =>
      SidebarNavigationItemLibraryPrimaryInputs();
}

class SidebarNavigationItemLibraryPrimaryInputs
    extends SidebarNavigationItemLibraryInputs {}
