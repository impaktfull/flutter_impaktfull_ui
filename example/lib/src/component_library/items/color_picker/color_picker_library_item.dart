import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/color_picker/color_picker_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_color_input.dart';

class ColorPickerLibraryItem extends ComponentLibraryItem {
  const ColorPickerLibraryItem();

  @override
  String get title => 'ImpaktfullUiColorPicker';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      for (final type in ImpaktfullUiColorPickerType.values) ...[
        ColorPickerLibraryVariant(type),
      ],
    ];
  }
}

class ColorPickerLibraryInputs extends ComponentLibraryInputs {
  final color = ComponentLibraryColorInput('Selected color');
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        color,
      ];
}
