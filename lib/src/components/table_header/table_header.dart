import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/table/table_column_builder.dart';
import 'package:impaktfull_ui/src/components/table/table_column_config.dart';
import 'package:impaktfull_ui/src/components/table/table_column_config_scope.dart';
import 'package:impaktfull_ui/src/components/table_header/table_header.dart';
import 'package:impaktfull_ui/src/components/table_header_item/table_header_item.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'table_header_style.dart';

class ImpaktfullUiTableHeader extends StatelessWidget {
  /// The width of every column. When empty (the default), the
  /// `columnConfig` of the `ImpaktfullUiTable` it is in is used.
  final List<ImpaktfullUiTableColumnConfig> columnConfig;
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
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Container(
        decoration: BoxDecoration(
          color: componentTheme.colors.background,
          borderRadius: componentTheme.dimens.borderRadius,
        ),
        child: TableColumnBuilder(
          minHeight: componentTheme.dimens.minHeight,
          config: ImpaktfullUiTableColumnConfigScope.resolve(
            context,
            columnConfig,
          ),
          children: titles,
        ),
      ),
    );
  }
}
