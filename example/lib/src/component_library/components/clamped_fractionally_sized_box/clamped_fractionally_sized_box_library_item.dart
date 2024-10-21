import 'package:impaktfull_ui_example/src/component_library/components/clamped_fractionally_sized_box/clamped_fractionally_sized_box_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ClampedFractionallySizedBoxLibraryItem extends ComponentLibraryItem {
  const ClampedFractionallySizedBoxLibraryItem();

  @override
  String get title => 'ImpaktfullUiClampedFractionallySizedBox';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const ClampedFractionallySizedBoxLibraryVariant(),
    ];
  }
}

class ClampedFractionallySizedBoxLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
