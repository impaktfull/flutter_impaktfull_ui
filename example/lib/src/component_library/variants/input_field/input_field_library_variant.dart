import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/input_field/input_field_library_item.dart';

class InputFieldVariant extends ComponentLibraryVariant<InputFieldLibraryVariantInputs> {
  InputFieldVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, InputFieldLibraryVariantInputs inputs) {
    final label = inputs.label.value ?? '{label}';
    final hint = inputs.hint.value ?? '{hint}';
    final value = inputs.value.value;
    final leadingIcon = inputs.leadingIcon.value;
    return [
      ImpaktfullUiInputField(
        leadingIcon: leadingIcon,
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
