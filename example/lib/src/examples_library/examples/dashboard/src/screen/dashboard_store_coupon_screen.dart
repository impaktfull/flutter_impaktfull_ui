import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/examples_library/data/test_data.dart';

class DashboardStoreCouponScreen extends StatefulWidget {
  const DashboardStoreCouponScreen({
    super.key,
  });

  @override
  State<DashboardStoreCouponScreen> createState() => _DashboardStoreCouponScreenState();
}

class _DashboardStoreCouponScreenState extends State<DashboardStoreCouponScreen> {
  static const columnConfig = [
    TableColumnConfig(flex: 1),
    TableColumnConfig(flex: 1),
    TableColumnConfig(flex: 1),
    TableColumnConfig(flex: 1),
  ];

  final coupons = TestData.getCoupons();

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAdaptiveScreen(
      title: 'Coupons',
      badge: '${coupons.length} coupons',
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: ImpaktfullUiTable(
          columnConfig: columnConfig,
          titles: const [
            ImpaktfullUiTableHeaderItem(title: 'Valid from'),
            ImpaktfullUiTableHeaderItem(title: 'Valid until'),
            ImpaktfullUiTableHeaderItem(title: 'Coupon code'),
            ImpaktfullUiTableHeaderItem(title: 'Discount'),
          ],
          content: [
            for (final order in coupons) ...[
              ImpaktfullUiTableRow(
                columnConfig: columnConfig,
                columns: [
                  ImpaktfullUiTableRowItem.text(
                    title: TestData.formatDate(order.validFrom, withTime: true),
                  ),
                  ImpaktfullUiTableRowItem.text(
                    title: TestData.formatDate(order.validUntil, withTime: true),
                  ),
                  ImpaktfullUiTableRowItem.text(
                    title: order.tag,
                  ),
                  ImpaktfullUiTableRowItem.badge(
                    title: TestData.formatPrice(order.totalDiscount),
                    badgeType: ImpaktfullUiBadgeType.primary,
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
