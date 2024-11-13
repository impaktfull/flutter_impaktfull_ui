import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/option_selector/option_selector_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class OptionSelectorLibraryVariant
    extends ComponentLibraryVariant<OptionSelectorLibraryPrimaryInputs> {
  const OptionSelectorLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, OptionSelectorLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiButton(
        type: ImpaktfullUiButtonType.primary,
        title: 'Select an option: ${inputs.value.value}',
        onTap: () async {
          final newValue = await ImpaktfullUiOptionSelector.show(
            context: context,
            title: 'Select an option',
            options: [
              for (final index in List.generate(100, (index) => index))
                'Option $index',
            ],
            selectedValue: inputs.value.value,
          );
          inputs.value.updateState(newValue);
        },
      ),
    ];
  }

  @override
  OptionSelectorLibraryPrimaryInputs inputs() =>
      OptionSelectorLibraryPrimaryInputs();
}

class OptionSelectorLibraryPrimaryInputs extends OptionSelectorLibraryInputs {}
