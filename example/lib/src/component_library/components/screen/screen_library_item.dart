import 'package:impaktfull_ui_example/src/component_library/components/screen/screen_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class ScreenLibraryItem extends ComponentLibraryItem {
  const ScreenLibraryItem();

  @override
  String get title => 'ImpaktfullUiScreen';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const ScreenLibraryVariant(),
    ];
  }
}

class ScreenLibraryInputs extends ComponentLibraryInputs {
  final title = ComponentLibraryStringInput(
    'Title',
    initialValue: 'My title',
  );
  final subtitle = ComponentLibraryStringInput(
    'Subtitle',
    initialValue: 'My subtitle',
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        title,
        subtitle,
      ];
}
