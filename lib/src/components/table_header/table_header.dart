import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/table/table_column_builder.dart';
import 'package:impaktfull_ui/src/components/table/table_column_config.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';

export 'table_header_style.dart';

class ImpaktfullUiTableHeader extends StatelessWidget {
  final List<TableColumnConfig> columnConfig;
  final List<ImpaktfullUiTableHeaderItem> titles;
  final ImpaktfullUiTableHeaderTheme? theme;

  const ImpaktfullUiTableHeader({
    required this.titles,
    this.columnConfig = const [],
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiTableHeaderTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => Container(
        decoration: BoxDecoration(
          color: componentTheme.colors.background,
          borderRadius: componentTheme.dimens.borderRadius,
        ),
        child: TableColumnBuilder(
          config: columnConfig,
          children: titles,
        ),
      ),
    );
  }
}
