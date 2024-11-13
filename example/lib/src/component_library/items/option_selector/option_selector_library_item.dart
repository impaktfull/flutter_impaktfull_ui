import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';
import 'package:impaktfull_ui_example/src/component_library/items/option_selector/option_selector_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class OptionSelectorLibraryItem extends ComponentLibraryItem {
  const OptionSelectorLibraryItem();

  @override
  String get title => 'ImpaktfullUiOptionSelector';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const OptionSelectorLibraryVariant(),
    ];
  }
}

class OptionSelectorLibraryInputs extends ComponentLibraryInputs {
  final value = ComponentLibraryStringInput(
    'Value',
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        value,
      ];
}
