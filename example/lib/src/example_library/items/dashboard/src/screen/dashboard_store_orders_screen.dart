import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/example_library/data/model/order.dart';
import 'package:impaktfull_ui_example/src/example_library/data/test_data.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DashboardStoreOrdersScreen extends StatefulWidget {
  const DashboardStoreOrdersScreen({
    super.key,
  });

  @override
  State<DashboardStoreOrdersScreen> createState() =>
      _DashboardStoreOrdersScreenState();
}

class _DashboardStoreOrdersScreenState
    extends State<DashboardStoreOrdersScreen> {
  static const columnConfig = [
    TableColumnConfig(flex: 1),
    TableColumnConfig(flex: 1),
    TableColumnConfig(flex: 1),
    TableColumnConfig.fixedSize(size: 44 * 3),
  ];

  final orders = TestData.getOrders();
  final _refundList = <Order>{};

  @override
  void initState() {
    super.initState();
    _refundList.add(orders[0]);
    _refundList.add(orders[4]);
    _refundList.add(orders[7]);
    _refundList.add(orders[10]);
    _refundList.add(orders[13]);
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAdaptiveScreen(
      title: 'Orders',
      badge: '${orders.length} orders',
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
                  title: 'Total orders',
                  value: orders.length.toString(),
                ),
                ImpaktfullUiMetric(
                  title: 'Total revenue',
                  value:
                      '€${orders.where((order) => !_refundList.contains(order)).fold(0.0, (sum, order) => sum + order.totalPrice)}',
                  extraTextValue: '50%',
                  leadingExtraTextValue: theme.assets.icons.arrowUp,
                  impactType: ImpaktfullUiMetricImpactType.positive,
                ),
                ImpaktfullUiMetric(
                  title: 'Refunded orders',
                  value: _refundList.length.toString(),
                ),
              ],
            ),
            Expanded(
              child: ImpaktfullUiTable(
                columnConfig: columnConfig,
                titles: const [
                  ImpaktfullUiTableHeaderItem(title: 'Date'),
                  ImpaktfullUiTableHeaderItem(title: 'Order id'),
                  ImpaktfullUiTableHeaderItem(title: 'Refunded'),
                  ImpaktfullUiTableHeaderItem(),
                ],
                content: [
                  for (final order in orders) ...[
                    ImpaktfullUiTableRow(
                      columnConfig: columnConfig,
                      columns: [
                        ImpaktfullUiTableRowItem.text(
                          title: TestData.formatDate(order.createdAt),
                        ),
                        ImpaktfullUiTableRowItem.text(
                          title: order.id,
                        ),
                        ImpaktfullUiTableRowItem.badge(
                          title:
                              _refundList.contains(order) ? 'Refunded' : null,
                          badgeType: ImpaktfullUiBadgeType.neutral,
                        ),
                        ImpaktfullUiTableRowItem.custom(
                          builder: (context, theme) =>
                              ImpaktfullUiAutoLayout.horizontal(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (!_refundList.contains(order)) ...[
                                ImpaktfullUiIconButton(
                                  onTap: () => _onRefundTapped(order),
                                  size: 20,
                                  asset: ImpaktfullUiAsset.icon(
                                      PhosphorIcons.handCoins()),
                                ),
                              ],
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

  void _onRefundTapped(Order order) {
    if (_refundList.contains(order)) {
      ImpaktfullUiNotification.show(
        title: 'No refund',
        subtitle: 'Order `${order.id}` was already refunded in the past',
        type: ImpaktfullUiNotificationType.warning,
      );
      return;
    }
    setState(() {
      _refundList.add(order);
    });
    ImpaktfullUiNotification.show(
      title: 'Refund complete',
      subtitle: 'Order `${order.id}` is refunded',
      type: ImpaktfullUiNotificationType.success,
    );
  }
}
