import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_enum_input.dart';
import 'package:impaktfull_ui_example/src/component_library/items/segmented_control/segmented_control_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class SegmentedControlLibraryItem extends ComponentLibraryItem {
  const SegmentedControlLibraryItem();

  @override
  String get title => 'ImpaktfullUiSegmentedControl';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const SegmentedControlLibraryVariant(),
    ];
  }
}

class SegmentedControlLibraryInputs extends ComponentLibraryInputs {
  final values = ComponentLibraryEnumInput(
    'Values',
    options: SegmentedControlLibraryTestValues.values,
    initialValue: SegmentedControlLibraryTestValues.item1,
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        values,
      ];
}

enum SegmentedControlLibraryTestValues {
  item1(label: 'Item 1'),
  item2(label: 'Item 2'),
  item3(label: 'Item 3');

  final String label;

  const SegmentedControlLibraryTestValues({
    required this.label,
  });
}
