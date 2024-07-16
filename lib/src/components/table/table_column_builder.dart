import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_2/src/components/table/table_column_config.dart';

class TableColumnBuilder extends StatelessWidget {
  final List<TableColumnConfig> config;
  final List<Widget> children;
  final EdgeInsets padding;

  const TableColumnBuilder({
    required this.config,
    required this.children,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
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
              Padding(
                padding: padding,
                child: children[i],
              ),
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
      );
    }
    return child;
  }
}
