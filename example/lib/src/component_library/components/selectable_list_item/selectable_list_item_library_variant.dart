import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/selectable_list_item/selectable_list_item_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class SelectableListItemLibraryVariant extends ComponentLibraryVariant<SelectableListItemLibraryPrimaryInputs> {
  const SelectableListItemLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, SelectableListItemLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiSelectableListItem(
        title: inputs.title.value ?? '',
        subtitle: inputs.subtitle.value,
        leading: theme.assets.icons.settings,
        isSelected: inputs.value.value ?? false,
        onChanged: inputs.value.updateState,
      ),
    ];
  }

  @override
  SelectableListItemLibraryPrimaryInputs inputs() => SelectableListItemLibraryPrimaryInputs();
}

class SelectableListItemLibraryPrimaryInputs extends SelectableListItemLibraryInputs {}
