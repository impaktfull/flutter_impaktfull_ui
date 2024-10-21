import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/fluid_padding/fluid_padding_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class FluidPaddingLibraryVariant
    extends ComponentLibraryVariant<FluidPaddingLibraryPrimaryInputs> {
  const FluidPaddingLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, FluidPaddingLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 400,
        color: theme.colors.accent,
        child: const ImpaktfullUiFluidPadding(
          breakPoints: [
            ImpaktfullUiFluidPaddingBreakPoint(
              label: 'Mobile',
              maxWidth: 600,
              padding: 16,
            ),
            ImpaktfullUiFluidPaddingBreakPoint(
              label: 'Tablet',
              minWidth: 600,
              maxWidth: 1024,
              padding: 32,
            ),
            ImpaktfullUiFluidPaddingBreakPoint(
              label: 'Desktop',
              minWidth: 1024,
              maxWidth: 1400,
              padding: 48,
            ),
            ImpaktfullUiFluidPaddingBreakPoint(
              label: 'Large Desktop',
              minWidth: 1400,
              maxWidth: 2000,
              padding: 64,
            ),
            ImpaktfullUiFluidPaddingBreakPoint(
              label: 'Ultra Wide Desktop',
              minWidth: 2000,
              padding: 72,
            ),
          ],
          child: Placeholder(),
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        height: 400,
        color: theme.colors.accent,
        child: const ImpaktfullUiFluidPadding(
          child: Placeholder(),
        ),
      ),
    ];
  }

  @override
  FluidPaddingLibraryPrimaryInputs inputs() =>
      FluidPaddingLibraryPrimaryInputs();
}

class FluidPaddingLibraryPrimaryInputs extends FluidPaddingLibraryInputs {}
