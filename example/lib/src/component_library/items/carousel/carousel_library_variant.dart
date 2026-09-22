import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/carousel/carousel_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class CarouselLibraryVariant
    extends ComponentLibraryVariant<CarouselLibraryPrimaryInputs> {
  const CarouselLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, CarouselLibraryPrimaryInputs inputs) {
    final theme = ImpaktfullUiTheme.of(context);
    return [
      ComponentsLibraryVariantDescriptor(
        height: 500,
        child: ImpaktfullUiCarousel(
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
        child: ImpaktfullUiCarousel(
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
  CarouselLibraryPrimaryInputs inputs() => CarouselLibraryPrimaryInputs();
}

class CarouselLibraryPrimaryInputs extends CarouselLibraryInputs {}
