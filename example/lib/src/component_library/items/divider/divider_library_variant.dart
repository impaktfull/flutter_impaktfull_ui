import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/divider/divider_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class DividerLibraryVariant
    extends ComponentLibraryVariant<DividerLibraryPrimaryInputs> {
  const DividerLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, DividerLibraryPrimaryInputs inputs) {
    return [
      const ImpaktfullUiDivider(),
    ];
  }

  @override
  DividerLibraryPrimaryInputs inputs() => DividerLibraryPrimaryInputs();
}

class DividerLibraryPrimaryInputs extends DividerLibraryInputs {}
