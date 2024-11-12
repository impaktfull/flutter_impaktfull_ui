import 'package:impaktfull_ui_example/src/component_library/items/fluid_padding/fluid_padding_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class FluidPaddingLibraryItem extends ComponentLibraryItem {
  const FluidPaddingLibraryItem();

  @override
  String get title => 'ImpaktfullUiFluidPadding';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const FluidPaddingLibraryVariant(),
    ];
  }
}

class FluidPaddingLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
