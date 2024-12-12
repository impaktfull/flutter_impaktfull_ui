import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/separated_column/separated_column_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class SeparatedColumnLibraryVariant
    extends ComponentLibraryVariant<SeparatedColumnLibraryPrimaryInputs> {
  const SeparatedColumnLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, SeparatedColumnLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiSeparatedColumn(
        title: inputs.title.value ?? '',
        separatorMargin: const EdgeInsets.symmetric(horizontal: 16),
        showFirstDivider: inputs.showFirstDivider.value ?? false,
        showLastDivider: inputs.showLastDivider.value ?? false,
        children: [
          for (final item in List.generate(
              inputs.amountOfItems.value ?? 0, (index) => index)) ...[
            ImpaktfullUiListItem(title: 'Item $item'),
          ]
        ],
      ),
    ];
  }

  @override
  SeparatedColumnLibraryPrimaryInputs inputs() =>
      SeparatedColumnLibraryPrimaryInputs();
}

class SeparatedColumnLibraryPrimaryInputs
    extends SeparatedColumnLibraryInputs {}
