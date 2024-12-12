import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/confetti/confetti_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ConfettiLibraryItem extends ComponentLibraryItem {
  const ConfettiLibraryItem();

  @override
  String get title => 'ImpaktfullUiConfetti';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    final types = [
      null,
      ...ImpaktfullUiConfettiType.values,
    ];
    return [
      for (final type in types) ...[
        ConfettiLibraryVariant(
          type: type,
        ),
      ],
    ];
  }
}

class ConfettiLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
