import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/items/overridable_component/overridable_component_library_variant.dart';

class OverridableComponentConfiguratorLibraryItem extends ComponentLibraryItem {
  const OverridableComponentConfiguratorLibraryItem();

  @override
  String get title => 'ImpaktfullUiOverridableComponentConfigurator';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const OverridableComponentConfiguratorLibraryVariant(),
    ];
  }
}

class OverridableComponentConfiguratorLibraryInputs
    extends ComponentLibraryInputs {
  final ComponentLibraryBoolInput value =
      ComponentLibraryBoolInput('Value', initialValue: false);

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [value];
}
