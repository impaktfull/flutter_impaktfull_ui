import 'package:impaktfull_ui_example/src/component_library/items/icon_button/icon_button_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_icon_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class IconButtonLibraryItem extends ComponentLibraryItem {
  const IconButtonLibraryItem();

  @override
  String get title => 'ImpaktfullUiIconButton';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      IconButtonTypeLibraryVariant(),
    ];
  }
}

class IconButtonLibraryInputs extends ComponentLibraryInputs {
  final icon = ComponentLibraryIconInput(
    'Icon',
    initialValue: PhosphorIcons.plus(),
  );
  final tooltip = ComponentLibraryStringInput(
    'Tooltip',
    initialValue: 'Add',
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        icon,
        tooltip,
      ];
}
