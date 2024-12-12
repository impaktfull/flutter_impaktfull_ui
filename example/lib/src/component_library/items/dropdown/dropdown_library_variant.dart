import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/dropdown/dropdown_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class DropdownVariant
    extends ComponentLibraryVariant<DropdownLibraryVariantInputs> {
  DropdownVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, DropdownLibraryVariantInputs inputs) {
    final childWidth = [300.0, null];
    return [
      for (final width in childWidth) ...[
        for (final alignment in ImpaktfullUiAlignment.values) ...[
          Align(
            alignment: Alignment.center,
            child: ImpaktfullUiDropdown(
              childWidth: width,
              alignment: alignment,
              buttonText: inputs.selectedValue.value ?? 'No value selected',
              child: ImpaktfullUiListView.builder(
                items: List.generate(100, (e) => 'Item $e'),
                itemBuilder: (context, item, index) => ImpaktfullUiListItem(
                  title: item,
                  onTap: () {
                    inputs.selectedValue.updateState(item);
                    ImpaktfullUiNotification.show(title: 'Tapped: $item');
                  },
                ),
                noDataLabel: 'No data',
              ),
            ),
          ),
        ],
      ],
    ];
  }

  @override
  DropdownLibraryVariantInputs inputs() => DropdownLibraryVariantInputs();
}

class DropdownLibraryVariantInputs extends DropdownLibraryInputs {}
