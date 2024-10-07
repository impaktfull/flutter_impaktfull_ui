import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/simple_list_item/simple_list_item_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class SimpleListItemLibraryItem extends ComponentLibraryItem {
  const SimpleListItemLibraryItem();

  @override
  String get title => 'ImpaktfullUiSimpleListItem';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      for (final type in ImpaktfullUiSimpleListItemType.values) ...[
        SimpleListItemLibraryVariant(type),
      ],
    ];
  }
}

class SimpleListItemLibraryInputs extends ComponentLibraryInputs {
  final title = ComponentLibraryStringInput(
    'Title',
    initialValue: 'Title',
  );
  final subtitle = ComponentLibraryStringInput(
    'Subtitle',
    initialValue: 'Subtitle',
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        title,
        subtitle,
      ];
}
