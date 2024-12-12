import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class DashboardStoreHomeScreen extends StatefulWidget {
  const DashboardStoreHomeScreen({
    super.key,
  });

  @override
  State<DashboardStoreHomeScreen> createState() =>
      _DashboardStoreHomeScreenState();
}

class _DashboardStoreHomeScreenState extends State<DashboardStoreHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAdaptiveScreen(
      title: 'Dashboard',
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
                  title: 'Products',
                  value: '100',
                  bottomValueBuilder: (context) =>
                      ImpaktfullUiProgressIndicator(
                    value: 100 / 100,
                    color: theme.colors.success,
                  ),
                ),
                ImpaktfullUiMetric(
                  title: 'Available for sale',
                  value: '96',
                  bottomValueBuilder: (context) =>
                      ImpaktfullUiProgressIndicator(
                    value: 96 / 100,
                    color: theme.colors.success,
                  ),
                ),
                ImpaktfullUiMetric(
                  title: 'Disabled sales',
                  value: '4',
                  bottomValueBuilder: (context) =>
                      ImpaktfullUiProgressIndicator(
                    value: 4 / 100,
                    color: theme.colors.error,
                  ),
                ),
                ImpaktfullUiCard(
                  height: 120,
                  child: ImpaktfullUiProgressIndicator(
                    value: 100 / 100,
                    type: ImpaktfullUiProgressIndicatorType.halfCircle,
                    showText: true,
                    color: theme.colors.success,
                  ),
                ),
                ImpaktfullUiCard(
                  height: 120,
                  child: ImpaktfullUiProgressIndicator(
                    value: 96 / 100,
                    type: ImpaktfullUiProgressIndicatorType.halfCircle,
                    showText: true,
                    color: theme.colors.success,
                  ),
                ),
                ImpaktfullUiCard(
                  height: 120,
                  child: ImpaktfullUiProgressIndicator(
                    value: 4 / 100,
                    type: ImpaktfullUiProgressIndicatorType.halfCircle,
                    showText: true,
                    color: theme.colors.error,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
