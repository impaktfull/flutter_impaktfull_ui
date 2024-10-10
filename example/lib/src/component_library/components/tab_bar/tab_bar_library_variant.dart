import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/tab_bar/tab_bar_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class TabBarLibraryVariant
    extends ComponentLibraryVariant<TabBarLibraryPrimaryInputs> {
  const TabBarLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, TabBarLibraryPrimaryInputs inputs) {
    return [
      const ImpaktfullUiTabBar(),
    ];
  }

  @override
  TabBarLibraryPrimaryInputs inputs() => TabBarLibraryPrimaryInputs();
}

class TabBarLibraryPrimaryInputs extends TabBarLibraryInputs {}
