import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';

class ComponentLibraryEnumInput<T extends Enum>
    extends ComponentLibraryInputItem<T> {
  final List<T> options;

  ComponentLibraryEnumInput(
    super.label, {
    required this.options,
    super.initialValue,
    super.extraInfo,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => ImpaktfullUiSeparatedColumn(
        children: [
          for (final item in options) ...[
            ImpaktfullUiRadioButtonListItem<T?>(
              title: item.name,
              value: item,
              groupValue: value,
              onChanged: updateState,
            ),
          ],
        ],
      ),
    );
  }
}
