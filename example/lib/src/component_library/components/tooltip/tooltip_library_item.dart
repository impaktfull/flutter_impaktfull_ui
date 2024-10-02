import 'package:impaktfull_ui_example/src/component_library/components/tooltip/tooltip_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class TooltipLibraryItem extends ComponentLibraryItem {
  const TooltipLibraryItem();

  @override
  String get title => 'ImpaktfullUiTooltip';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const TooltipLibraryVariant(),
    ];
  }
}

class TooltipLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
