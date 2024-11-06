import 'package:impaktfull_ui_example/src/component_library/components/touch_feedback_sequence/touch_feedback_sequence_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class TouchFeedbackSequenceLibraryItem extends ComponentLibraryItem {
  const TouchFeedbackSequenceLibraryItem();

  @override
  String get title => 'ImpaktfullUiTouchFeedbackSequence';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const TouchFeedbackSequenceLibraryVariant(),
    ];
  }
}

class TouchFeedbackSequenceLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
