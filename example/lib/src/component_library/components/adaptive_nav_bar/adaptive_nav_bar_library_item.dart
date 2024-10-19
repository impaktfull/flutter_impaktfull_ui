import 'package:impaktfull_ui_example/src/component_library/components/adaptive_nav_bar/adaptive_nav_bar_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class AdaptiveNavBarLibraryItem extends ComponentLibraryItem {
  const AdaptiveNavBarLibraryItem();

  @override
  String get title => 'ImpaktfullUiAdaptiveNavBar';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const AdaptiveNavBarLibraryVariant(),
    ];
  }
}

class AdaptiveNavBarLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
