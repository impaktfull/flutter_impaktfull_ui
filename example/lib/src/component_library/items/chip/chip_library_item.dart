import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_icon_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';
import 'package:impaktfull_ui_example/src/component_library/items/chip/chip_library_variant.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class ChipLibraryItem extends ComponentLibraryItem {
  const ChipLibraryItem();

  @override
  String get title => 'ImpaktfullUiChip';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const ChipLibraryVariant(),
    ];
  }
}

class ChipLibraryInputs extends ComponentLibraryInputs {
  final title = ComponentLibraryStringInput(
    'Title',
    initialValue: 'Chip title',
  );
  final value = ComponentLibraryBoolInput(
    'Value',
    initialValue: false,
  );
  final leadingIcon = ComponentLibraryIconInput(
    'Leading icon',
    initialValue: PhosphorIcons.star,
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        title,
        value,
        leadingIcon,
      ];
}
