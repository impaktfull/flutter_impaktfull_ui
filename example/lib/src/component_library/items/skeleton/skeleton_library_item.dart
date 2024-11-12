import 'package:impaktfull_ui_example/src/component_library/items/skeleton/skeleton_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class SkeletonLibraryItem extends ComponentLibraryItem {
  const SkeletonLibraryItem();

  @override
  String get title => 'ImpaktfullUiSkeleton';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const SkeletonLibraryVariant(),
    ];
  }
}

class SkeletonLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
