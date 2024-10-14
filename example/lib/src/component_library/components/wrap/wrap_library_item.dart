import 'package:impaktfull_ui_example/src/component_library/components/wrap/wrap_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class WrapLibraryItem extends ComponentLibraryItem {
  const WrapLibraryItem();

  @override
  String get title => 'ImpaktfullUiWrap';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const WrapLibraryVariant(),
    ];
  }
}

class WrapLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
