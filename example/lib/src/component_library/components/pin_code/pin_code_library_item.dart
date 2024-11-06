import 'package:impaktfull_ui_example/src/component_library/components/pin_code/pin_code_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class PinCodeLibraryItem extends ComponentLibraryItem {
  const PinCodeLibraryItem();

  @override
  String get title => 'ImpaktfullUiPinCode';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const PinCodeLibraryVariant(),
    ];
  }
}

class PinCodeLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
