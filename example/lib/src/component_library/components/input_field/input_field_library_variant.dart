import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/input_field/input_field_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class InputFieldVariant
    extends ComponentLibraryVariant<InputFieldLibraryVariantInputs> {
  InputFieldVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, InputFieldLibraryVariantInputs inputs) {
    final label = inputs.label.value;
    final hint = inputs.hint.value ?? '{hint}';
    final value = inputs.value.value;
    final leadingIcon = inputs.leadingIcon.value;
    return [
      ImpaktfullUiInputField(
        leadingIcon:
            leadingIcon == null ? null : ImpaktfullUiAsset.icon(leadingIcon),
        label: label,
        hint: hint,
        value: value,
        onChanged: inputs.value.updateState,
      ),
    ];
  }

  @override
  InputFieldLibraryVariantInputs inputs() => InputFieldLibraryVariantInputs();
}

class InputFieldLibraryVariantInputs extends InputLibraryInputs {}
