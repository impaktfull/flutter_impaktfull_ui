import 'package:impaktfull_ui_example/src/component_library/items/adaptive_safe_area/adaptive_safe_area_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class AdaptiveSafeAreaLibraryItem extends ComponentLibraryItem {
  const AdaptiveSafeAreaLibraryItem();

  @override
  String get title => 'ImpaktfullUiAdaptiveSafeArea';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const AdaptiveSafeAreaLibraryVariant(),
    ];
  }
}

class AdaptiveSafeAreaLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
