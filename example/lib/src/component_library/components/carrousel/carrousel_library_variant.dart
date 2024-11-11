import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/carrousel/carrousel_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class CarrouselLibraryVariant extends ComponentLibraryVariant<CarrouselLibraryPrimaryInputs> {
  const CarrouselLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, CarrouselLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 500,
        child: ImpaktfullUiCarrousel(
          items: [
            Container(
              margin: const EdgeInsets.all(16),
              color: theme.colors.accent,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              color: theme.colors.card,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              color: theme.colors.card2,
            ),
          ],
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        height: 500,
        child: ImpaktfullUiCarrousel(
          loop: true,
          autoplay: true,
          items: [
            Container(
              margin: const EdgeInsets.all(16),
              color: theme.colors.accent,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              color: theme.colors.card,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              color: theme.colors.card2,
            ),
          ],
        ),
      ),
    ];
  }

  @override
  CarrouselLibraryPrimaryInputs inputs() => CarrouselLibraryPrimaryInputs();
}

class CarrouselLibraryPrimaryInputs extends CarrouselLibraryInputs {}
