import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';
import 'package:impaktfull_ui_example/src/component_library/components/cms_header/cms_header_library_variant.dart';

class CmsHeaderLibraryItem extends ComponentLibraryItem {
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
  final ComponentLibraryStringInput title = ComponentLibraryStringInput('Title');
  final ComponentLibraryStringInput subtitle = ComponentLibraryStringInput('Subtitle');
  final ComponentLibraryStringInput badge = ComponentLibraryStringInput('Badge');
  final ComponentLibraryIntInput selectedTab = ComponentLibraryIntInput('Tab index', initialValue: 0);

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        title,
        subtitle,
        badge,
        selectedTab,
      ];
}
