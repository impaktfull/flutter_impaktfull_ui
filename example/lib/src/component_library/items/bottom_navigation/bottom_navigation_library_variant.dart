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
    final theme = ImpaktfullUiTheme.of(context);
    return [
      ImpaktfullUiBottomNavigation(
        items: [
          ImpaktfullUiBottomNavigationItem(
            asset: theme.assets.icons.home,
            title: 'Home',
            onTap: () => inputs.selectedIndex.updateState(0),
            isSelected: inputs.selectedIndex.value == 0,
          ),
          ImpaktfullUiBottomNavigationItem(
            asset: theme.assets.icons.search,
            title: 'Search',
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
            title: 'List',
            onTap: () => inputs.selectedIndex.updateState(2),
            isSelected: inputs.selectedIndex.value == 2,
          ),
          ImpaktfullUiBottomNavigationItem(
            asset: theme.assets.icons.settings,
            title: 'Settings',
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
            title: 'Home',
            showTitle: false,
            onTap: () => inputs.selectedIndex.updateState(0),
            isSelected: inputs.selectedIndex.value == 0,
          ),
          ImpaktfullUiBottomNavigationItem(
            asset: theme.assets.icons.search,
            showTitle: false,
            title: 'Search',
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
            title: 'Settings',
            showTitle: false,
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
