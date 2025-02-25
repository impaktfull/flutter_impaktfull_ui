import 'package:impaktfull_ui_example/src/component_library/items/color_input_field/color_input_field_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ColorInputFieldLibraryItem extends ComponentLibraryItem {
  const ColorInputFieldLibraryItem();

  @override
  String get title => 'ImpaktfullUiColorInputField';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const ColorInputFieldLibraryVariant(),
    ];
  }
}

class ColorInputFieldLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
