import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/items/master_detail/master_detail_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class MasterDetailLibraryItem extends ComponentLibraryItem {
  const MasterDetailLibraryItem();

  @override
  String get title => 'ImpaktfullUiMasterDetail';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const MasterDetailLibraryVariant(),
    ];
  }
}

class MasterDetailLibraryInputs extends ComponentLibraryInputs {
  final hasDetail = ComponentLibraryBoolInput(
    'Has Detail',
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        hasDetail,
      ];
}
