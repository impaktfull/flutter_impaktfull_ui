import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/check_box_list_item/check_box_list_item_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class CheckBoxListItemLibraryVariant
    extends ComponentLibraryVariant<CheckBoxListItemLibraryPrimaryInputs> {
  const CheckBoxListItemLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, CheckBoxListItemLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiCheckBoxListItem(
        title: 'CheckBoxListItem',
        value: inputs.value.value ?? false,
        onChanged: inputs.value.updateState,
      ),
      ImpaktfullUiCheckBoxListItem.indermediate(
        title: 'CheckBoxListItem',
        value: inputs.value.value,
        onChanged: inputs.value.updateState,
      ),
    ];
  }

  @override
  CheckBoxListItemLibraryPrimaryInputs inputs() =>
      CheckBoxListItemLibraryPrimaryInputs();
}

class CheckBoxListItemLibraryPrimaryInputs
    extends CheckBoxListItemLibraryInputs {}
