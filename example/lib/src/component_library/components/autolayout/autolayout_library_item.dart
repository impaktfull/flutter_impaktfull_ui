import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/autolayout/autolayout_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class AutoLayoutLibraryItem extends ComponentLibraryItem {
  const AutoLayoutLibraryItem();

  @override
  String get title => 'ImpaktfullUiAutoLayout';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      for (final orientation in ImpaktfullUiAutoLayoutOrientation.values) ...[
        AutoLayoutLibraryVariant(orientation),
      ]
    ];
  }
}

class AutoLayoutLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
