import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/table/table_column_builder.dart';
import 'package:impaktfull_ui_2/src/components/table/table_column_config.dart';
import 'package:impaktfull_ui_2/src/components/table_header/table_header.dart';
import 'package:impaktfull_ui_2/src/components/table_header_item/table_header_item.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

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
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiTableHeaderTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Container(
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
