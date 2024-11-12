import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/tooltip/tooltip_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TooltipLibraryVariant
    extends ComponentLibraryVariant<TooltipLibraryPrimaryInputs> {
  const TooltipLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, TooltipLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiTooltip(
        message: 'Confetti icon',
        child: Icon(
          PhosphorIcons.confetti(),
          color: theme.colors.text,
        ),
      ),
    ];
  }

  @override
  TooltipLibraryPrimaryInputs inputs() => TooltipLibraryPrimaryInputs();
}

class TooltipLibraryPrimaryInputs extends TooltipLibraryInputs {}
