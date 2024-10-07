import 'package:impaktfull_ui_example/src/component_library/components/avatar/avatar_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class AvatarLibraryItem extends ComponentLibraryItem {
  const AvatarLibraryItem();

  @override
  String get title => 'ImpaktfullUiAvatar';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const AvatarLibraryVariant(),
    ];
  }
}

class AvatarLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
