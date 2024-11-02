import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/auto_complete/auto_complete_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class AutoCompleteLibraryVariant extends ComponentLibraryVariant<AutoCompleteLibraryPrimaryInputs> {
  const AutoCompleteLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, AutoCompleteLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiAutoComplete(
        placeholder: 'Search...',
        leadingBuilder: () {
          if (inputs.selectedIndex.value == null) {
            return null;
          }
          return ImpaktfullUiBadge(
            label: 'Selected index is `${inputs.selectedIndex.value}`',
            type: ImpaktfullUiBadgeType.neutral,
            onCloseTap: () => inputs.selectedIndex.updateState(null),
          );
        },
        onSearchChanged: (String value) async {
          await Future.delayed(const Duration(milliseconds: 500));
          return List.generate(10, (index) => '$index: `$value`');
        },
        itemBuilder: (BuildContext context, String item, int index, ImpaktfullUiAutoCompleteController controller) =>
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
        topBuilder: () {
          if (inputs.selectedIndex.value == null) {
            return [];
          }
          return [
            ImpaktfullUiBadge(
              label: 'Selected index is `${inputs.selectedIndex.value}`',
              type: ImpaktfullUiBadgeType.neutral,
              onCloseTap: () => inputs.selectedIndex.updateState(null),
            ),
            ImpaktfullUiBadge(
              label: 'Selected index is `${inputs.selectedIndex.value}`',
              type: ImpaktfullUiBadgeType.neutral,
              onCloseTap: () => inputs.selectedIndex.updateState(null),
            ),
          ];
        },
        onSearchChanged: (String value) async {
          await Future.delayed(const Duration(milliseconds: 500));
          return List.generate(10, (index) => '$index: `$value`');
        },
        itemBuilder: (BuildContext context, String item, int index, ImpaktfullUiAutoCompleteController controller) =>
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
  AutoCompleteLibraryPrimaryInputs inputs() => AutoCompleteLibraryPrimaryInputs();
}

class AutoCompleteLibraryPrimaryInputs extends AutoCompleteLibraryInputs {}
