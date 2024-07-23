import 'package:impaktfull_ui_example/src/component_library/components/divider/divider_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class DividerLibraryItem extends ComponentLibraryItem {
  const DividerLibraryItem();

  @override
  String get title => 'ImpaktfullUiDivider';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const DividerLibraryVariant(),
    ];
  }
}

class DividerLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}

