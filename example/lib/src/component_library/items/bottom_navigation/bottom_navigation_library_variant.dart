import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/bottom_navigation/bottom_navigation_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class BottomNavigationLibraryVariant
    extends ComponentLibraryVariant<BottomNavigationLibraryPrimaryInputs> {
  const BottomNavigationLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, BottomNavigationLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiBottomNavigation(
        items: [
          ImpaktfullUiBottomNavigationItem(
            asset: theme.assets.icons.home,
            label: 'Home',
            onTap: () => inputs.selectedIndex.updateState(0),
            isSelected: inputs.selectedIndex.value == 0,
          ),
          ImpaktfullUiBottomNavigationItem(
            asset: theme.assets.icons.search,
            label: 'Search',
            onTap: () => inputs.selectedIndex.updateState(1),
            isSelected: inputs.selectedIndex.value == 1,
          ),
          ImpaktfullUiTouchFeedback(
            onTap: () {},
            color: theme.colors.accent,
            borderRadius: theme.dimens.borderRadiusCircle,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ImpaktfullUiAssetWidget(
                asset: theme.assets.icons.add,
                color: theme.colors.textOnAccent,
              ),
            ),
          ),
          ImpaktfullUiBottomNavigationItem(
            asset: theme.assets.icons.list,
            label: 'List',
            onTap: () => inputs.selectedIndex.updateState(2),
            isSelected: inputs.selectedIndex.value == 2,
          ),
          ImpaktfullUiBottomNavigationItem(
            asset: theme.assets.icons.settings,
            label: 'Settings',
            onTap: () => inputs.selectedIndex.updateState(3),
            isSelected: inputs.selectedIndex.value == 3,
            badgeShow: true,
            badgeText: '3',
          ),
        ],
      ),
      ImpaktfullUiBottomNavigation(
        items: [
          ImpaktfullUiBottomNavigationItem(
            asset: theme.assets.icons.home,
            label: 'Home',
            showLabel: false,
            onTap: () => inputs.selectedIndex.updateState(0),
            isSelected: inputs.selectedIndex.value == 0,
          ),
          ImpaktfullUiBottomNavigationItem(
            asset: theme.assets.icons.search,
            showLabel: false,
            label: 'Search',
            onTap: () => inputs.selectedIndex.updateState(1),
            isSelected: inputs.selectedIndex.value == 1,
          ),
          ImpaktfullUiTouchFeedback(
            onTap: () {},
            color: theme.colors.accent,
            borderRadius: theme.dimens.borderRadiusCircle,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ImpaktfullUiAssetWidget(
                asset: theme.assets.icons.add,
                color: theme.colors.textOnAccent,
              ),
            ),
          ),
          ImpaktfullUiBottomNavigationItem(
            asset: theme.assets.icons.list,
            onTap: () => inputs.selectedIndex.updateState(2),
            isSelected: inputs.selectedIndex.value == 2,
          ),
          ImpaktfullUiBottomNavigationItem(
            asset: theme.assets.icons.settings,
            label: 'Settings',
            showLabel: false,
            onTap: () => inputs.selectedIndex.updateState(2),
            isSelected: inputs.selectedIndex.value == 2,
            badgeShow: true,
            badgeText: '3',
          ),
        ],
      ),
    ];
  }

  @override
  BottomNavigationLibraryPrimaryInputs inputs() =>
      BottomNavigationLibraryPrimaryInputs();
}

class BottomNavigationLibraryPrimaryInputs
    extends BottomNavigationLibraryInputs {}
