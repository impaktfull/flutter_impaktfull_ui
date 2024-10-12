import 'package:impaktfull_ui_example/src/component_library/components/markdown/markdown_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class MarkdownLibraryItem extends ComponentLibraryItem {
  const MarkdownLibraryItem();

  @override
  String get title => 'ImpaktfullUiMarkdown';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const MarkdownLibraryVariant(),
    ];
  }
}

class MarkdownLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}

