import 'package:impaktfull_ui_example/src/component_library/items/password_strength_indicator/password_strength_indicator_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class PasswordStrengthIndicatorLibraryItem extends ComponentLibraryItem {
  const PasswordStrengthIndicatorLibraryItem();

  @override
  String get title => 'ImpaktfullUiPasswordStrengthIndicator';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const PasswordStrengthIndicatorLibraryVariant(),
    ];
  }
}

class PasswordStrengthIndicatorLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
