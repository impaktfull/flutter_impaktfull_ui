import 'package:impaktfull_ui_example/src/component_library/items/introduction/introduction_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class IntroductionLibraryItem extends ComponentLibraryItem {
  const IntroductionLibraryItem();

  @override
  String get title => 'ImpaktfullUiIntroduction';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const IntroductionLibraryVariant(),
    ];
  }
}

class IntroductionLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
