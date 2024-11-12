import 'package:impaktfull_ui_example/src/component_library/items/loading_error_data/loading_error_data_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class LoadingErrorDataLibraryItem extends ComponentLibraryItem {
  const LoadingErrorDataLibraryItem();

  @override
  String get title => 'ImpaktfullUiLoadingErrorData';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const LoadingErrorDataLibraryVariant(),
    ];
  }
}

class LoadingErrorDataLibraryInputs extends ComponentLibraryInputs {
  final isLoading = ComponentLibraryBoolInput('Loading');
  final itemSize = ComponentLibraryIntInput('Item size');
  final errorTitle = ComponentLibraryStringInput('Error title');
  final errorMessage = ComponentLibraryStringInput('Error message');

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        isLoading,
        itemSize,
        errorTitle,
        errorMessage,
      ];
}
