import 'package:impaktfull_ui_example/src/component_library/components/unified_screen_layout/unified_screen_layout_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class UnifiedScreenLayoutLibraryItem extends ComponentLibraryItem {
  const UnifiedScreenLayoutLibraryItem();

  @override
  String get title => 'ImpaktfullUiUnifiedScreenLayout';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const UnifiedScreenLayoutLibraryVariant(),
    ];
  }
}

class UnifiedScreenLayoutLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
