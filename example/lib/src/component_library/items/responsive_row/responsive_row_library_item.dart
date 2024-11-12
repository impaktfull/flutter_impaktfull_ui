import 'package:impaktfull_ui_example/src/component_library/items/responsive_row/responsive_row_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ResponsiveRowLibraryItem extends ComponentLibraryItem {
  const ResponsiveRowLibraryItem();

  @override
  String get title => 'ImpaktfullUiResponsiveRow';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const ResponsiveRowLibraryVariant(),
    ];
  }
}

class ResponsiveRowLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
