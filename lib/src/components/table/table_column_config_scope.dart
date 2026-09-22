import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/table/table_column_config.dart';

/// Passes the `columnConfig` of an `ImpaktfullUiTable` to its header and
/// rows, so they do not need their own copy.
class ImpaktfullUiTableColumnConfigScope extends InheritedWidget {
  final List<ImpaktfullUiTableColumnConfig> columnConfig;

  const ImpaktfullUiTableColumnConfigScope({
    required this.columnConfig,
    required super.child,
    super.key,
  });

  /// The column config of the closest table, or null outside of a table.
  static List<ImpaktfullUiTableColumnConfig>? maybeOf(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<
              ImpaktfullUiTableColumnConfigScope>()
          ?.columnConfig;

  /// [columnConfig] when it is not empty, otherwise the column config of the
  /// closest table (or an empty list outside of a table).
  static List<ImpaktfullUiTableColumnConfig> resolve(
    BuildContext context,
    List<ImpaktfullUiTableColumnConfig> columnConfig,
  ) {
    if (columnConfig.isNotEmpty) return columnConfig;
    return maybeOf(context) ?? const [];
  }

  @override
  bool updateShouldNotify(ImpaktfullUiTableColumnConfigScope oldWidget) =>
      columnConfig != oldWidget.columnConfig;
}
