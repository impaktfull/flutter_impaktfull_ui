import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_icon_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';
import 'package:impaktfull_ui_example/src/component_library/components/badge/badge_type_library_variant.dart';

class BadgeLibraryItem extends ComponentLibraryItem {
  const BadgeLibraryItem();
  @override
  String get title => 'ImpaktfullUiBadge';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      for (final type in ImpaktfullUiBadgeType.values) ...[
        BadgeTypeLibraryVariant(type),
      ],
    ];
  }
}

class BadgeLibraryInputs extends ComponentLibraryInputs {
  final ComponentLibraryStringInput label =
      ComponentLibraryStringInput('Title');
  final ComponentLibraryIconInput leadingIcon =
      ComponentLibraryIconInput('Leading icon');
  final ComponentLibraryIconInput trailingIcon =
      ComponentLibraryIconInput('TrailingIcon icon');

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        label,
        leadingIcon,
        trailingIcon,
      ];
}
