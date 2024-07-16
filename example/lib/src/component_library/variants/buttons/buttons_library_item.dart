import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_icon_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/buttons/buttons_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/component_library.dart';

class ButtonsLibraryItem extends ComponentLibraryItem {
  @override
  String get title => 'ImpaktfullUiButton';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      for (final type in ImpaktfullUiButtonType.values) ...[
        ButtonTypeVariant(type: type),
      ]
    ];
  }
}

class ButtonsLibraryInputs extends ComponentLibraryInputs {
  final ComponentLibraryStringInput title = ComponentLibraryStringInput('Title');
  final ComponentLibraryIconInput leadingIcon = ComponentLibraryIconInput('Leading icon');
  final ComponentLibraryIconInput trailingIcon = ComponentLibraryIconInput('TrailingIcon icon');

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        title,
        leadingIcon,
        trailingIcon,
      ];
}
