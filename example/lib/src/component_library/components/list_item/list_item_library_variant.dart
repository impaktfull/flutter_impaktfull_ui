import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/list_item/list_item_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ListItemLibraryVariant
    extends ComponentLibraryVariant<ListItemLibraryPrimaryInputs> {
  const ListItemLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, ListItemLibraryPrimaryInputs inputs) {
    return [
      const ImpaktfullUiListItem(),
    ];
  }

  @override
  ListItemLibraryPrimaryInputs inputs() => ListItemLibraryPrimaryInputs();
}

class ListItemLibraryPrimaryInputs extends ListItemLibraryInputs {}
