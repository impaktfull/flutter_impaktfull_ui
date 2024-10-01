import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/table/table_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/components/components_library_variant_descriptor.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TableVariant extends ComponentLibraryVariant<TableLibraryVariantInputs> {
  TableVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, TableLibraryVariantInputs inputs) {
    const columnConfig = [
      TableColumnConfig(flex: 1),
      TableColumnConfig(flex: 1),
      TableColumnConfig(flex: 1),
      TableColumnConfig(flex: 1),
      TableColumnConfig.fixedSize(size: 44 * 3),
    ];
    return [
      ComponentsLibraryVariantDescriptor(
        height: 400,
        child: ImpaktfullUiTable(
          columnConfig: columnConfig,
          titles: [
            ImpaktfullUiTableHeaderItem.checkbox(
              title: 'Title 1',
              isSelected: inputs.selectedAll.value,
              onChanged: inputs.selectedAll.updateState,
              onTap: () => inputs.sortOnTitle1.toggle(),
              ascending: inputs.sortOnTitle1.value,
            ),
            const ImpaktfullUiTableHeaderItem(title: 'Title 2'),
            const ImpaktfullUiTableHeaderItem(title: 'Title 3'),
            const ImpaktfullUiTableHeaderItem(title: 'Title 4'),
            const ImpaktfullUiTableHeaderItem(),
          ],
          content: [
            for (var i = 0; i < 999; i++) ...[
              ImpaktfullUiTableRow(
                columnConfig: columnConfig,
                columns: [
                  ImpaktfullUiTableRowItem.checkbox(
                    isSelected: inputs.selectedAll.value == true ? true : i == inputs.selectedIndex.value,
                    onChanged: (value) => inputs.selectedIndex.toggle(i),
                    title: 'Value: $i',
                    onTap: () {},
                  ),
                  ImpaktfullUiTableRowItem.text(title: 'Value: $i'),
                  ImpaktfullUiTableRowItem.badge(title: 'Value: $i'),
                  ImpaktfullUiTableRowItem.text(title: 'Value: $i'),
                  ImpaktfullUiTableRowItem.custom(
                    builder: (context, theme) => ImpaktfullUiAutoLayout.horizontal(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ImpaktfullUiIconButton(
                          onTap: () {},
                          size: 20,
                          color: Colors.green,
                          asset: ImpaktfullUiAsset.icon(PhosphorIcons.sealCheck()),
                        ),
                        ImpaktfullUiIconButton(
                          onTap: () => SnackyController.instance.showMessage(
                            (context) => const Snacky(
                              title: 'Edit disabled',
                              subtitle: 'Edit is temporary disabled',
                              type: SnackyType.warning,
                              canBeClosed: true,
                            ),
                          ),
                          size: 20,
                          asset: ImpaktfullUiAsset.icon(PhosphorIcons.pencilSimple()),
                        ),
                        ImpaktfullUiIconButton(
                          onTap: () => SnackyController.instance.showMessage(
                            (context) => const Snacky(
                              title: 'Failed to delete',
                              subtitle: 'It is not possible to delete this item',
                              type: SnackyType.error,
                              canBeClosed: true,
                            ),
                          ),
                          size: 20,
                          asset: ImpaktfullUiAsset.icon(PhosphorIcons.trash()),
                        ),
                      ],
                    ),
                  ),
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
