import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_icon_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';
import 'package:impaktfull_ui_example/src/component_library/items/badge/badge_type_library_variant.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
  final label = ComponentLibraryStringInput(
    'Title',
    initialValue: 'Badge label',
  );
  final leadingIcon = ComponentLibraryIconInput(
    'Leading icon',
    initialValue: PhosphorIcons.plus(),
  );
  final trailingIcon = ComponentLibraryIconInput(
    'TrailingIcon icon',
    initialValue: PhosphorIcons.plus(),
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        label,
        leadingIcon,
        trailingIcon,
      ];
}
