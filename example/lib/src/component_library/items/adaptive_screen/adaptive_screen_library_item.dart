import 'package:impaktfull_ui_example/src/component_library/items/adaptive_screen/adaptive_screen_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class AdaptiveScreenLibraryItem extends ComponentLibraryItem {
  const AdaptiveScreenLibraryItem();

  @override
  String get title => 'ImpaktfullUiAdaptiveScreen';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const AdaptiveScreenLibraryVariant(),
    ];
  }
}

class AdaptiveScreenLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
