import 'package:impaktfull_ui_example/src/component_library/items/refreshindicator/refreshindicator_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class RefreshIndicatorLibraryItem extends ComponentLibraryItem {
  const RefreshIndicatorLibraryItem();

  @override
  String get title => 'ImpaktfullUiRefreshIndicator';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const RefreshIndicatorLibraryVariant(),
    ];
  }
}

class RefreshIndicatorLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
