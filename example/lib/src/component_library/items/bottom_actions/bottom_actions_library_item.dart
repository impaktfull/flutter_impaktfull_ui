import 'package:impaktfull_ui_example/src/component_library/items/bottom_actions/bottom_actions_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class BottomActionsLibraryItem extends ComponentLibraryItem {
  const BottomActionsLibraryItem();

  @override
  String get title => 'ImpaktfullUiBottomActions';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const BottomActionsLibraryVariant(),
    ];
  }
}

class BottomActionsLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
