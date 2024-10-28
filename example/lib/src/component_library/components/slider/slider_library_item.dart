import 'package:impaktfull_ui_example/src/component_library/components/slider/slider_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_double_input.dart';

class SliderLibraryItem extends ComponentLibraryItem {
  const SliderLibraryItem();

  @override
  String get title => 'ImpaktfullUiSlider';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const SliderLibraryVariant(),
    ];
  }
}

class SliderLibraryInputs extends ComponentLibraryInputs {
  final value = ComponentLibraryDoubleInput(
    'Value',
    initialValue: 20.0,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        value,
      ];
}
