import 'package:impaktfull_ui_example/src/component_library/components/network_image/network_image_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class NetworkImageLibraryItem extends ComponentLibraryItem {
  const NetworkImageLibraryItem();

  @override
  String get title => 'ImpaktfullUiNetworkImage';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const NetworkImageLibraryVariant(),
    ];
  }
}

class NetworkImageLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}

