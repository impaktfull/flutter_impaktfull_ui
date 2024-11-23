import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/introduction/introduction_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class IntroductionLibraryVariant
    extends ComponentLibraryVariant<IntroductionLibraryPrimaryInputs> {
  const IntroductionLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, IntroductionLibraryPrimaryInputs inputs) {
    return [
      const ImpaktfullUiIntroduction(),
    ];
  }

  @override
  IntroductionLibraryPrimaryInputs inputs() =>
      IntroductionLibraryPrimaryInputs();
}

class IntroductionLibraryPrimaryInputs extends IntroductionLibraryInputs {}
