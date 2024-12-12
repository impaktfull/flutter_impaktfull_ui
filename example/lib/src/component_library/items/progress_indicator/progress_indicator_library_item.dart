import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/progress_indicator/progress_indicator_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';

class ProgressIndicatorLibraryItem extends ComponentLibraryItem {
  const ProgressIndicatorLibraryItem();

  @override
  String get title => 'ImpaktfullUiProgressIndicator';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      for (final type in ImpaktfullUiProgressIndicatorType.values) ...[
        ProgressIndicatorLibraryVariant(type: type),
      ],
    ];
  }
}

class ProgressIndicatorLibraryInputs extends ComponentLibraryInputs {
  final value = ComponentLibraryIntInput(
    'Value',
    initialValue: 50,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
