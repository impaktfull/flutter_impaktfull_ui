import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/radio_button_list_item/radio_button_list_item_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class RadioButtonListItemLibraryVariant extends ComponentLibraryVariant<RadioButtonListItemLibraryPrimaryInputs> {
  const RadioButtonListItemLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, RadioButtonListItemLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiRadioButtonListItem(
        title: inputs.title.value ?? '',
        subtitle: inputs.subtitle.value,
        leading: theme.assets.icons.settings,
        value: '1',
        groupValue: inputs.groupValue.value,
        onChanged: inputs.groupValue.updateState,
      ),
      ImpaktfullUiRadioButtonListItem(
        title: inputs.title.value ?? '',
        subtitle: inputs.subtitle.value,
        leading: theme.assets.icons.settings,
        value: '2',
        groupValue: inputs.groupValue.value,
        onChanged: inputs.groupValue.updateState,
      ),
      ImpaktfullUiRadioButtonListItem(
        title: inputs.title.value ?? '',
        subtitle: inputs.subtitle.value,
        leading: theme.assets.icons.settings,
        value: '3',
        groupValue: inputs.groupValue.value,
        onChanged: inputs.groupValue.updateState,
      ),
    ];
  }

  @override
  RadioButtonListItemLibraryPrimaryInputs inputs() => RadioButtonListItemLibraryPrimaryInputs();
}

class RadioButtonListItemLibraryPrimaryInputs extends RadioButtonListItemLibraryInputs {}
