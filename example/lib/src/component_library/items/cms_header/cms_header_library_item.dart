import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';
import 'package:impaktfull_ui_example/src/component_library/items/cms_header/cms_header_library_variant.dart';

class CmsHeaderLibraryItem extends ComponentLibraryItem {
  const CmsHeaderLibraryItem();

  @override
  String get title => 'ImpaktfullUiCmsHeader';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      CmsHeaderVariant(),
    ];
  }
}

class CmsHeaderLibraryInputs extends ComponentLibraryInputs {
  final title = ComponentLibraryStringInput('Title', initialValue: '{title}');
  final subtitle =
      ComponentLibraryStringInput('Subtitle', initialValue: '{subtitle}');
  final badge = ComponentLibraryStringInput('Badge');
  final selectedTab = ComponentLibraryIntInput('Tab index', initialValue: 0);

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        title,
        subtitle,
        badge,
        selectedTab,
      ];
}
