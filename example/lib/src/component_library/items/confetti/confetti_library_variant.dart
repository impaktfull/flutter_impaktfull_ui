import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/confetti/confetti_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class ConfettiLibraryVariant
    extends ComponentLibraryVariant<ConfettiLibraryPrimaryInputs> {
  final ImpaktfullUiConfettiType? type;

  const ConfettiLibraryVariant({
    this.type,
  });

  @override
  String get title => type?.name ?? 'random';

  @override
  List<Widget> build(
      BuildContext context, ConfettiLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 500,
        wrapWithCard: true,
        padding: EdgeInsets.zero,
        child: ImpaktfullUiConfetti(
          type: type,
          excludedTypesWithRandom: type == null
              ? [ImpaktfullUiConfettiType.leaf, ImpaktfullUiConfettiType.snow]
              : [],
          color: type == ImpaktfullUiConfettiType.snow
              ? const Color(0xFFC0F6FB)
              : null,
          randomColors: type == ImpaktfullUiConfettiType.leaf
              ? [
                  Colors.amber,
                  Colors.orange,
                  Colors.brown,
                  Colors.red.shade700,
                  Colors.deepOrange,
                ]
              : null,
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        height: 500,
        wrapWithCard: true,
        padding: EdgeInsets.zero,
        child: ImpaktfullUiConfetti(
          type: type,
          repeat: false,
          excludedTypesWithRandom: type == null
              ? [ImpaktfullUiConfettiType.leaf, ImpaktfullUiConfettiType.snow]
              : [],
          color: type == ImpaktfullUiConfettiType.snow
              ? const Color(0xFFC0F6FB)
              : null,
          randomColors: type == ImpaktfullUiConfettiType.leaf
              ? [
                  Colors.amber,
                  Colors.orange,
                  Colors.brown,
                  Colors.red.shade700,
                  Colors.deepOrange,
                ]
              : null,
          initialDelay: const Duration(milliseconds: 300),
        ),
      ),
    ];
  }

  @override
  ConfettiLibraryPrimaryInputs inputs() => ConfettiLibraryPrimaryInputs();
}

class ConfettiLibraryPrimaryInputs extends ConfettiLibraryInputs {}
