import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/auto_complete/auto_complete_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class AutoCompleteLibraryVariant
    extends ComponentLibraryVariant<AutoCompleteLibraryPrimaryInputs> {
  const AutoCompleteLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, AutoCompleteLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiAutoComplete(
        placeholder: 'Search...',
        builder: () {
          if (inputs.selectedIndex.value == null) {
            return null;
          }
          return Text(
            'Selected index: (${inputs.selectedIndex.value}) |',
            style: theme.textStyles.onCard.text.small,
          );
        },
        onSearchChanged: (String value) async {
          await Future.delayed(const Duration(milliseconds: 500));
          return List.generate(10, (index) => '$index: `$value`');
        },
        itemBuilder: (BuildContext context, String item, int index,
                ImpaktfullUiAutoCompleteController controller) =>
            ImpaktfullUiListItem(
          title: item,
          subtitle: 'Top autocomplete field',
          onTap: () {
            inputs.selectedIndex.updateState(index);
            controller.close();
          },
        ),
        noDataLabel: 'No data found',
      ),
      const SizedBox(height: 1000),
      ImpaktfullUiAutoComplete(
        placeholder: 'Search...',
        builder: () {
          if (inputs.selectedIndex.value == null) {
            return null;
          }
          return Text(
            'Selected index: (${inputs.selectedIndex.value}) |',
            style: theme.textStyles.onCard.text.small,
          );
        },
        onSearchChanged: (String value) async {
          await Future.delayed(const Duration(milliseconds: 500));
          return List.generate(10, (index) => '$index: `$value`');
        },
        itemBuilder: (BuildContext context, String item, int index,
                ImpaktfullUiAutoCompleteController controller) =>
            ImpaktfullUiListItem(
          title: item,
          subtitle: 'Bottom autocomplete field',
          onTap: () {
            inputs.selectedIndex.updateState(index);
            controller.close();
          },
        ),
        noDataLabel: 'No data found',
      ),
    ];
  }

  @override
  AutoCompleteLibraryPrimaryInputs inputs() =>
      AutoCompleteLibraryPrimaryInputs();
}

class AutoCompleteLibraryPrimaryInputs extends AutoCompleteLibraryInputs {}
