import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/snacky/snacky_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';

class SnackyLibraryItem extends ComponentLibraryItem {
  const SnackyLibraryItem();

  @override
  String get title => 'ImpaktfullUiSnacky';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      for (final type in SnackyType.values) ...[
        SnackyLibraryVariant(type),
      ],
    ];
  }
}

class SnackyLibraryInputs extends ComponentLibraryInputs {
  final ComponentLibraryBoolInput cancelAll =
      ComponentLibraryBoolInput('Cancel all');
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        cancelAll,
      ];
}
