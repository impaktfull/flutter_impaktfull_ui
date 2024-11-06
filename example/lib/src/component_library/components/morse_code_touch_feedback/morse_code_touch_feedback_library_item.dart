import 'package:impaktfull_ui_example/src/component_library/components/morse_code_touch_feedback/morse_code_touch_feedback_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class MorseCodeTouchFeedbackLibraryItem extends ComponentLibraryItem {
  const MorseCodeTouchFeedbackLibraryItem();

  @override
  String get title => 'ImpaktfullUiMorseCodeTouchFeedback';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const MorseCodeTouchFeedbackLibraryVariant(),
    ];
  }
}

class MorseCodeTouchFeedbackLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
