import 'package:impaktfull_ui_example/src/component_library/items/responsive_layout/responsive_layout_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ResponsiveLayoutLibraryItem extends ComponentLibraryItem {
  const ResponsiveLayoutLibraryItem();

  @override
  String get title => 'ImpaktfullUiResponsiveLayout';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const ResponsiveLayoutLibraryVariant(),
    ];
  }
}

class ResponsiveLayoutLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
