import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/wysiwyg/wysiwyg_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_enum_input.dart';

class WysiwygLibraryItem extends ComponentLibraryItem {
  const WysiwygLibraryItem();

  @override
  String get title => 'ImpaktfullUiWysiwyg';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const WysiwygLibraryVariant(),
    ];
  }
}

class WysiwygLibraryInputs extends ComponentLibraryInputs {
  final previewType = ComponentLibraryEnumInput<ImpaktfullUiWysiwygType>(
    'Preview type',
    // initialValue: ImpaktfullUiWysiwygType.html, REVERT BACK TO THIS!
    initialValue: ImpaktfullUiWysiwygType.markdown,
    options: ImpaktfullUiWysiwygType.values,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        previewType,
      ];
}
