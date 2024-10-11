import 'package:impaktfull_ui_example/src/component_library/components/wysiwyg/wysiwyg_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class WysiwygLibraryItem extends ComponentLibraryItem {
  const WysiwygLibraryItem();

  @override
  String get title => 'ImpaktfullUiWysiwyg';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const WysiwygLibraryVariant(),
    ];
  }
}

class WysiwygLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}

