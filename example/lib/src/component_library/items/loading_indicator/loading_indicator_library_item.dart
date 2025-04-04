import 'package:impaktfull_ui_example/src/component_library/items/loading_indicator/loading_indicator_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class LoadingIndicatorLibraryItem extends ComponentLibraryItem {
  const LoadingIndicatorLibraryItem();

  @override
  String get title => 'ImpaktfullUiLoadingIndicator';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      LoadingIndicatorVariant(),
    ];
  }
}

class LoadingIndicatorLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
