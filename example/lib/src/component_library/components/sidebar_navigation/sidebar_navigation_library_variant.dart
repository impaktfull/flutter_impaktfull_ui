import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/sidebar_navigation/sidebar_navigation_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class SidebarNavigationLibraryVariant
    extends ComponentLibraryVariant<SidebarNavigationLibraryPrimaryInputs> {
  const SidebarNavigationLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, SidebarNavigationLibraryPrimaryInputs inputs) {
    return [
      const ImpaktfullUiSidebarNavigation(),
    ];
  }

  @override
  SidebarNavigationLibraryPrimaryInputs inputs() =>
      SidebarNavigationLibraryPrimaryInputs();
}

class SidebarNavigationLibraryPrimaryInputs
    extends SidebarNavigationLibraryInputs {}
