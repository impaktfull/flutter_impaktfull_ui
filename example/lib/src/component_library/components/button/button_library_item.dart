import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_icon_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';
import 'package:impaktfull_ui_example/src/component_library/components/button/button_type_library_variant.dart';

class ButtonLibraryItem extends ComponentLibraryItem {
  const ButtonLibraryItem();

  @override
  String get title => 'ImpaktfullUiButton';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      for (final type in ImpaktfullUiButtonType.values) ...[
        ButtonTypeLibraryVariant(type: type),
      ]
    ];
  }
}

class ButtonLibraryInputs extends ComponentLibraryInputs {
  final title = ComponentLibraryStringInput(
    'Title',
    initialValue: "{button_value}",
  );
  final leadingIcon = ComponentLibraryIconInput(
    'Leading icon',
    initialValue: Icons.add,
  );
  final trailingIcon = ComponentLibraryIconInput(
    'TrailingIcon icon',
    initialValue: Icons.add,
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        title,
        leadingIcon,
        trailingIcon,
      ];
}
