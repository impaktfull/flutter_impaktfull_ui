import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/clamped_fractionally_sized_box/clamped_fractionally_sized_box_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ClampedFractionallySizedBoxLibraryVariant extends ComponentLibraryVariant<
    ClampedFractionallySizedBoxLibraryPrimaryInputs> {
  const ClampedFractionallySizedBoxLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context,
      ClampedFractionallySizedBoxLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiClampedFractionallySizedBox(
        widthFactor: 0.2,
        minWidth: 200,
        maxWidth: 1000,
        child: Container(
          color: theme.colors.accent,
          height: 50,
        ),
      ),
    ];
  }

  @override
  ClampedFractionallySizedBoxLibraryPrimaryInputs inputs() =>
      ClampedFractionallySizedBoxLibraryPrimaryInputs();
}

class ClampedFractionallySizedBoxLibraryPrimaryInputs
    extends ClampedFractionallySizedBoxLibraryInputs {}
