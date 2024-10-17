import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/examples_library/data/test_data.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DashboardStoreProductsScreen extends StatefulWidget {
  const DashboardStoreProductsScreen({
    super.key,
  });

  @override
  State<DashboardStoreProductsScreen> createState() =>
      _DashboardStoreProductsScreenState();
}

class _DashboardStoreProductsScreenState
    extends State<DashboardStoreProductsScreen> {
  static const columnConfig = [
    TableColumnConfig(flex: 2),
    TableColumnConfig(flex: 1),
    TableColumnConfig(flex: 1),
    TableColumnConfig.fixedSize(size: 44 * 3),
  ];

  final list = TestData.getProducts();
  final _verifiedList = <String>{};

  @override
  void initState() {
    super.initState();
    _verifiedList.add(list[0]);
    _verifiedList.add(list[4]);
    _verifiedList.add(list[7]);
    _verifiedList.add(list[10]);
    _verifiedList.add(list[13]);
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiScreen(
      title: 'Products',
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: ImpaktfullUiTable(
          columnConfig: columnConfig,
          titles: const [
            ImpaktfullUiTableHeaderItem(title: 'Naam product'),
            ImpaktfullUiTableHeaderItem(title: 'Stock'),
            ImpaktfullUiTableHeaderItem(title: 'On Sale'),
            ImpaktfullUiTableHeaderItem(),
          ],
          content: [
            for (final i in list) ...[
              ImpaktfullUiTableRow(
                columnConfig: columnConfig,
                columns: [
                  ImpaktfullUiTableRowItem.text(
                    title: i,
                    subtitle: i.hashCode % 4 == 0 ? 'New product' : null,
                  ),
                  ImpaktfullUiTableRowItem.text(
                      title: (i.hashCode % 100).toString()),
                  ImpaktfullUiTableRowItem.badge(
                    title: _verifiedList.contains(i)
                        ? 'Sale disabled'
                        : 'Active sale',
                    badgeType: _verifiedList.contains(i)
                        ? ImpaktfullUiBadgeType.error
                        : ImpaktfullUiBadgeType.success,
                  ),
                  ImpaktfullUiTableRowItem.custom(
                    builder: (context, theme) =>
                        ImpaktfullUiAutoLayout.horizontal(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ImpaktfullUiIconButton(
                          onTap: () => _onEditTapped(i),
                          size: 20,
                          asset: ImpaktfullUiAsset.icon(
                              PhosphorIcons.pencilSimple()),
                        ),
                        ImpaktfullUiIconButton(
                          onTap: () => _onDeleteTapped(i),
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
    );
  }

  void _onEditTapped(String item) {
    final isActiveSale = list.contains(item);
    setState(() {
      if (_verifiedList.contains(item)) {
        _verifiedList.remove(item);
      } else {
        _verifiedList.add(item);
      }
    });
    ImpaktfullUiNotification.show(
      title: '`$item` updated',
      subtitle: 'Sale is ${isActiveSale ? 'disabled' : 'active'}',
      type: ImpaktfullUiNotificationType.success,
    );
  }

  void _onDeleteTapped(String item) {
    setState(() => list.remove(item));
    ImpaktfullUiNotification.show(
      title: '`$item` is deleted',
      subtitle: 'Item is deleted, but only for this session.',
    );
  }
}
