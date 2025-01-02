import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/bottom_actions/bottom_actions_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class BottomActionsLibraryVariant
    extends ComponentLibraryVariant<BottomActionsLibraryPrimaryInputs> {
  const BottomActionsLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, BottomActionsLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiBottomActions(
        children: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Primary button',
            fullWidth: true,
            onTap: () {},
          ),
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.secondary,
            title: 'Secondary button',
            fullWidth: true,
            onTap: () {},
          ),
        ],
      ),
    ];
  }

  @override
  BottomActionsLibraryPrimaryInputs inputs() =>
      BottomActionsLibraryPrimaryInputs();
}

class BottomActionsLibraryPrimaryInputs extends BottomActionsLibraryInputs {}
