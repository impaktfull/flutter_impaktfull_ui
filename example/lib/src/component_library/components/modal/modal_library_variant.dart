import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/modal/modal_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ModalLibraryVariant extends ComponentLibraryVariant<ModalLibraryPrimaryInputs> {
  const ModalLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, ModalLibraryPrimaryInputs inputs) {
    return [
      const ImpaktfullUiModal(),
    ];
  }

  @override
  ModalLibraryPrimaryInputs inputs() => ModalLibraryPrimaryInputs();
}

class ModalLibraryPrimaryInputs extends ModalLibraryInputs {}
