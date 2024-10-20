import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/examples_library/data/model/product.dart';
import 'package:impaktfull_ui_example/src/examples_library/data/test_data.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DashboardStoreProductsScreen extends StatefulWidget {
  const DashboardStoreProductsScreen({
    super.key,
  });

  @override
  State<DashboardStoreProductsScreen> createState() => _DashboardStoreProductsScreenState();
}

class _DashboardStoreProductsScreenState extends State<DashboardStoreProductsScreen> {
  static const columnConfig = [
    TableColumnConfig(flex: 1),
    TableColumnConfig(flex: 1),
    TableColumnConfig(flex: 1),
    TableColumnConfig(flex: 1),
    TableColumnConfig.fixedSize(size: 44 * 3),
  ];

  final products = TestData.getProducts();
  final _disabledSalesList = <Product>{};

  @override
  void initState() {
    super.initState();
    _disabledSalesList.add(products[0]);
    _disabledSalesList.add(products[4]);
    _disabledSalesList.add(products[7]);
    _disabledSalesList.add(products[10]);
    _disabledSalesList.add(products[13]);
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAdaptiveScreen(
      title: 'Products',
      badge: '${products.length} products',
      isDrawerEnabled: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: ImpaktfullUiAutoLayout.vertical(
          spacing: 8,
          children: [
            ImpaktfullUiResponsiveRow(
              horizontalSpacing: 8,
              verticalSpacing: 8,
              maxColumns: 1,
              mediumMaxColumns: 2,
              largeMaxColumns: 3,
              children: [
                ImpaktfullUiMetric(
                  title: 'Amount of products',
                  value: products.length.toString(),
                  leftValueBuilder: (context) => ImpaktfullUiLineChart(
                    height: 25,
                    data: [
                      ImpaktfullUiLineChartItemData(
                        style: ImpaktfullUiLineChartItemStyle(
                          lineColor: theme.colors.accent,
                          gradientEnabled: true,
                        ),
                        points: [
                          ImpaktfullUiLineChartItemDataItem(x: 0.0, y: 25.0),
                          ImpaktfullUiLineChartItemDataItem(x: 1.0, y: 60.0),
                          ImpaktfullUiLineChartItemDataItem(x: 2.0, y: 40.0),
                          ImpaktfullUiLineChartItemDataItem(x: 3.0, y: 50.0),
                          ImpaktfullUiLineChartItemDataItem(x: 4.0, y: 80.0),
                          ImpaktfullUiLineChartItemDataItem(x: 5.0, y: products.length.toDouble()),
                        ],
                        offsetBuilder: (x, y) => Offset(x, y),
                      ),
                    ],
                  ),
                ),
                ImpaktfullUiMetric(
                  title: 'Active sales items',
                  value: '${products.length - _disabledSalesList.length}',
                  leftValueBuilder: (context) => ImpaktfullUiLineChart(
                    height: 25,
                    data: [
                      ImpaktfullUiLineChartItemData(
                        style: ImpaktfullUiLineChartItemStyle(
                          lineColor: theme.colors.success,
                          gradientEnabled: true,
                        ),
                        points: [
                          ImpaktfullUiLineChartItemDataItem(x: 0.0, y: 25.0),
                          ImpaktfullUiLineChartItemDataItem(x: 1.0, y: 59.0),
                          ImpaktfullUiLineChartItemDataItem(x: 2.0, y: 37.0),
                          ImpaktfullUiLineChartItemDataItem(x: 3.0, y: 50.0),
                          ImpaktfullUiLineChartItemDataItem(x: 4.0, y: 75.0),
                          ImpaktfullUiLineChartItemDataItem(
                            x: 5.0,
                            y: (products.length - _disabledSalesList.length).toDouble(),
                          ),
                        ],
                        offsetBuilder: (x, y) => Offset(x, y),
                      ),
                    ],
                  ),
                ),
                ImpaktfullUiMetric(
                  title: 'Disabled sales items',
                  value: _disabledSalesList.length.toString(),
                  leftValueBuilder: (context) => ImpaktfullUiLineChart(
                    height: 25,
                    data: [
                      ImpaktfullUiLineChartItemData(
                        style: ImpaktfullUiLineChartItemStyle(
                          lineColor: theme.colors.text,
                          gradientEnabled: true,
                        ),
                        points: [
                          ImpaktfullUiLineChartItemDataItem(x: 0.0, y: 0.0),
                          ImpaktfullUiLineChartItemDataItem(x: 1.0, y: 1.0),
                          ImpaktfullUiLineChartItemDataItem(x: 2.0, y: 3.0),
                          ImpaktfullUiLineChartItemDataItem(x: 3.0, y: 0.0),
                          ImpaktfullUiLineChartItemDataItem(x: 4.0, y: 5.0),
                          ImpaktfullUiLineChartItemDataItem(x: 5.0, y: _disabledSalesList.length.toDouble()),
                        ],
                        offsetBuilder: (x, y) => Offset(x, y),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: ImpaktfullUiTable(
                columnConfig: columnConfig,
                titles: const [
                  ImpaktfullUiTableHeaderItem(title: 'Order id'),
                  ImpaktfullUiTableHeaderItem(title: 'Price'),
                  ImpaktfullUiTableHeaderItem(title: 'Stock'),
                  ImpaktfullUiTableHeaderItem(title: 'On Sale'),
                  ImpaktfullUiTableHeaderItem(),
                ],
                content: [
                  for (final product in products) ...[
                    ImpaktfullUiTableRow(
                      columnConfig: columnConfig,
                      columns: [
                        ImpaktfullUiTableRowItem.text(
                          title: product.name,
                          subtitle: product.isNewProduct ? 'New product' : null,
                        ),
                        ImpaktfullUiTableRowItem.text(title: TestData.formatPrice(product.price)),
                        ImpaktfullUiTableRowItem.text(title: product.stock.toString()),
                        ImpaktfullUiTableRowItem.badge(
                          title: _disabledSalesList.contains(product) ? 'Sale disabled' : 'Active sale',
                          badgeType: _disabledSalesList.contains(product)
                              ? ImpaktfullUiBadgeType.error
                              : ImpaktfullUiBadgeType.success,
                        ),
                        ImpaktfullUiTableRowItem.custom(
                          builder: (context, theme) => ImpaktfullUiAutoLayout.horizontal(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ImpaktfullUiIconButton(
                                onTap: () => _onEditTapped(product),
                                size: 20,
                                asset: ImpaktfullUiAsset.icon(PhosphorIcons.pencilSimple()),
                              ),
                              ImpaktfullUiIconButton(
                                onTap: () => _onDeleteTapped(product),
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
          ],
        ),
      ),
    );
  }

  void _onEditTapped(Product item) {
    final isDisabledSale = _disabledSalesList.contains(item);
    setState(() {
      if (_disabledSalesList.contains(item)) {
        _disabledSalesList.remove(item);
      } else {
        _disabledSalesList.add(item);
      }
    });
    ImpaktfullUiNotification.show(
      title: 'Order is updated',
      subtitle: 'Sale is ${isDisabledSale ? 'active' : 'disabled'}',
      type: ImpaktfullUiNotificationType.success,
    );
  }

  void _onDeleteTapped(Product item) {
    setState(() {
      products.remove(item);
      if (_disabledSalesList.contains(item)) {
        _disabledSalesList.remove(item);
      }
    });
    ImpaktfullUiNotification.show(
      title: 'Order is deleted',
      subtitle: '`${item.sku}` is deleted, but only for this session.',
    );
  }
}
