import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/accordion/accordion_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class AccordionLibraryVariant
    extends ComponentLibraryVariant<AccordionLibraryPrimaryInputs> {
  const AccordionLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, AccordionLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiAccordion(
        title: 'Item1',
        revealType: inputs.revealType.value!,
        expanded: inputs.expanded.value ?? false,
        onExpandedChanged: inputs.expanded.updateState,
        expandedBuilder: (context) => Container(
          width: double.infinity,
          color: theme.colors.accent,
          padding: const EdgeInsets.all(16),
          child: ImpaktfullUiAutoLayout.vertical(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Disclaimer 1',
                style: theme.textStyles.onAccent.text.small.medium,
              ),
            ],
          ),
        ),
      ),
      ImpaktfullUiAccordion(
        title: 'Item2',
        revealType: inputs.revealType.value!,
        expanded: inputs.expanded2.value ?? false,
        onExpandedChanged: inputs.expanded2.updateState,
        expandedBuilder: (context) => Container(
          width: double.infinity,
          color: theme.colors.accent,
          padding: const EdgeInsets.all(16),
          child: ImpaktfullUiAutoLayout.vertical(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Disclaimer 2',
                style: theme.textStyles.onAccent.text.small.medium,
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  AccordionLibraryPrimaryInputs inputs() => AccordionLibraryPrimaryInputs();
}

class AccordionLibraryPrimaryInputs extends AccordionLibraryInputs {}
