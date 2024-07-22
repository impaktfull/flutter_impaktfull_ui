import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/card/card_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class CardVariant extends ComponentLibraryVariant<CardLibraryVariantInputs> {
  CardVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, CardLibraryVariantInputs inputs) {
    return [
      const ImpaktfullUiCard(
        child: SizedBox(
          height: 200,
          width: 200,
        ),
      ),
    ];
  }

  @override
  CardLibraryVariantInputs inputs() => CardLibraryVariantInputs();
}

class CardLibraryVariantInputs extends CardLibraryInputs {}
