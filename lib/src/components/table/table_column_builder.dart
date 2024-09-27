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
            _buildItem(
              i > config.length - 1 ? const TableColumnConfig(flex: 1) : config[i],
              children[i],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildItem(TableColumnConfig config, Widget child) {
    if (config.flex != null) {
      return Expanded(
        flex: config.flex!,
        child: child,
      );
    }
    if (config.minWidth != null && config.maxWidth != null) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: config.minWidth!,
          maxWidth: config.maxWidth!,
        ),
        child: child,
      );
    }
    return child;
  }
}
