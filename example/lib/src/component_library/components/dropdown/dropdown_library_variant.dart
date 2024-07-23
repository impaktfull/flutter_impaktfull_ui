import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/dropdown/dropdown_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class DropdownVariant extends ComponentLibraryVariant<DropdownLibraryVariantInputs> {
  DropdownVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, DropdownLibraryVariantInputs inputs) {
    final childWidth = [300.0, null];
    return [
      for (final width in childWidth) ...[
        for (final alignment in ImpaktfullUiAlignment.values) ...[
          Align(
            alignment: Alignment.center,
            child: ImpaktfullUiDropdown(
              childWidth: width,
              alignment: alignment,
              child: ListView(
                children: [
                  for (final item in List.generate(100, (e) => e)) Text("Testing: $item"),
                ],
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
