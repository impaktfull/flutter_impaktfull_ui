import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/accordion/accordion_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_enum_input.dart';

class AccordionLibraryItem extends ComponentLibraryItem {
  const AccordionLibraryItem();

  @override
  String get title => 'ImpaktfullUiAccordion';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const AccordionLibraryVariant(),
    ];
  }
}

class AccordionLibraryInputs extends ComponentLibraryInputs {
  final revealType = ComponentLibraryEnumInput(
    'Reveal type',
    options: ImpaktfullUiAccordionRevealType.values,
    initialValue: ImpaktfullUiAccordionRevealType.topDown,
  );
  final expanded = ComponentLibraryBoolInput(
    'Expanded',
    initialValue: true,
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        revealType,
        expanded,
      ];
}
