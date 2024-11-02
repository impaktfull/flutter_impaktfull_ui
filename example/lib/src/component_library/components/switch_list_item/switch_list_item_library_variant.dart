import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/switch_list_item/switch_list_item_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class SwitchListItemLibraryVariant extends ComponentLibraryVariant<SwitchListItemLibraryPrimaryInputs> {
  const SwitchListItemLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, SwitchListItemLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiSwitchListItem(
        title: inputs.title.value ?? '',
        subtitle: inputs.subtitle.value,
        leading: theme.assets.icons.settings,
        value: inputs.switchValue.value ?? false,
        onChanged: inputs.switchValue.updateState,
      ),
    ];
  }

  @override
  SwitchListItemLibraryPrimaryInputs inputs() => SwitchListItemLibraryPrimaryInputs();
}

class SwitchListItemLibraryPrimaryInputs extends SwitchListItemLibraryInputs {}
