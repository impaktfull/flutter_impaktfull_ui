import 'package:impaktfull_ui_example/src/component_library/components/section_title/section_title_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class SectionTitleLibraryItem extends ComponentLibraryItem {
  const SectionTitleLibraryItem();

  @override
  String get title => 'ImpaktfullUiSectionTitle';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const SectionTitleLibraryVariant(),
    ];
  }
}

class SectionTitleLibraryInputs extends ComponentLibraryInputs {
  final title = ComponentLibraryStringInput(
    'Title',
    initialValue: 'My custom title',
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        title,
      ];
}
