import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/floating_action_button/floating_action_button_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class FloatingActionButtonLibraryVariant
    extends ComponentLibraryVariant<FloatingActionButtonLibraryPrimaryInputs> {
  const FloatingActionButtonLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, FloatingActionButtonLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiFloatingActionButton(
        asset: theme.assets.icons.add,
        onTap: () {
          ImpaktfullUiNotification.show(title: 'On fab tapped');
        },
      ),
      ImpaktfullUiFloatingActionButton(
        asset: theme.assets.icons.add,
        label: 'Add',
        expanded: inputs.expanded.value ?? false,
        onTap: () {
          ImpaktfullUiNotification.show(title: 'On fab tapped');
        },
      ),
    ];
  }

  @override
  FloatingActionButtonLibraryPrimaryInputs inputs() =>
      FloatingActionButtonLibraryPrimaryInputs();
}

class FloatingActionButtonLibraryPrimaryInputs
    extends FloatingActionButtonLibraryInputs {}
