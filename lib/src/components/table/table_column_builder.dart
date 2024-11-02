import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/table/table_column_config.dart';

class TableColumnBuilder extends StatelessWidget {
  final List<TableColumnConfig> config;
  final List<Widget> children;

  const TableColumnBuilder({
    required this.config,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 48),
      child: ImpaktfullUiAutoLayout.horizontal(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var i = 0; i < children.length; ++i) ...[
            _buildItem(i),
          ],
        ],
      ),
    );
  }

  Widget _buildItem(int i) {
    final tableColumnConfig =
        i > config.length - 1 ? const TableColumnConfig(flex: 1) : config[i];
    final child = children[i];
    if (tableColumnConfig.flex != null) {
      return Expanded(
        flex: tableColumnConfig.flex!,
        child: child,
      );
    }
    final isLast = i == children.length - 1;

    if (tableColumnConfig.minWidth != null &&
        tableColumnConfig.maxWidth != null) {
      final extraSize = isLast ? 8 : 0;
      return ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: tableColumnConfig.minWidth! + extraSize,
          maxWidth: tableColumnConfig.maxWidth! + extraSize,
        ),
        child: child,
      );
    }
    return child;
  }
}
