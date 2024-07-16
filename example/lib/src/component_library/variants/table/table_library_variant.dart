import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/table/table_library_item.dart';

class TableVariant extends ComponentLibraryVariant<TableLibraryVariantInputs> {
  TableVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, TableLibraryVariantInputs inputs) {
    return [
      SizedBox(
        height: 400,
        child: ImpaktfullUiTable(
          titles: const [
            ImpaktfullUiTableHeaderItem(title: 'Title 1'),
            ImpaktfullUiTableHeaderItem(title: 'Title 2'),
            ImpaktfullUiTableHeaderItem(title: 'Title 3'),
            ImpaktfullUiTableHeaderItem(title: 'Title 4'),
          ],
          content: [
            for (var i = 0; i < 999; i++) ...[
              ImpaktfullUiTableRow(
                columns: [
                  ImpaktfullUiTableRowItem.text(title: 'Value: $i'),
                  ImpaktfullUiTableRowItem.text(title: 'Value: $i'),
                  ImpaktfullUiTableRowItem.badge(title: 'Value: $i'),
                  ImpaktfullUiTableRowItem.text(title: 'Value: $i'),
                ],
              ),
            ],
          ],
        ),
      ),
    ];
  }

  @override
  TableLibraryVariantInputs inputs() => TableLibraryVariantInputs();
}

class TableLibraryVariantInputs extends TableLibraryInputs {}
