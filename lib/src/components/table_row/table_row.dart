import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/table/table_column_builder.dart';
import 'package:impaktfull_ui/src/components/table/table_column_config.dart';
import 'package:impaktfull_ui/src/components/table_row/table_row_style.dart';
import 'package:impaktfull_ui/src/components/table_row_item/table_row_item.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';

export 'table_row_style.dart';

class ImpaktfullUiTableRow extends StatelessWidget {
  final List<TableColumnConfig> columnConfig;
  final List<ImpaktfullUiTableRowItem> columns;
  final VoidCallback? onTap;
  final ImpaktfullUiTableRowTheme? theme;

  const ImpaktfullUiTableRow({
    required this.columns,
    this.columnConfig = const [],
    this.onTap,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiTableRowTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiTouchFeedback(
        onTap: onTap,
        child: TableColumnBuilder(
          config: columnConfig,
          children: columns,
        ),
      ),
    );
  }
}
