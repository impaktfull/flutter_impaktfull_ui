import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/bottom_navigation_item/bottom_navigation_item_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class BottomNavigationItemLibraryVariant
    extends ComponentLibraryVariant<BottomNavigationItemLibraryPrimaryInputs> {
  const BottomNavigationItemLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, BottomNavigationItemLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiBottomNavigationItem(
        asset: theme.assets.icons.home,
        isSelected: inputs.isSelected.value ?? false,
        onTap: inputs.isSelected.toggle,
        badgeShow: inputs.badgeShow.value ?? false,
        badgeText: inputs.badgeText.value,
      ),
    ];
  }

  @override
  BottomNavigationItemLibraryPrimaryInputs inputs() =>
      BottomNavigationItemLibraryPrimaryInputs();
}

class BottomNavigationItemLibraryPrimaryInputs
    extends BottomNavigationItemLibraryInputs {}