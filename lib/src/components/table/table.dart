import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui/src/components/table/table.dart';
import 'package:impaktfull_ui/src/components/table/table_column_config.dart';
import 'package:impaktfull_ui/src/components/table/table_column_config_scope.dart';
import 'package:impaktfull_ui/src/components/table/table_row_index_scope.dart';
import 'package:impaktfull_ui/src/components/table_header/table_header.dart';
import 'package:impaktfull_ui/src/components/table_header_item/table_header_item.dart';
import 'package:impaktfull_ui/src/components/table_row/table_row.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'table_style.dart';

class ImpaktfullUiTable extends StatelessWidget {
  /// The width of every column. The header and every row of [content] use it,
  /// unless they have a `columnConfig` of their own.
  final List<ImpaktfullUiTableColumnConfig> columnConfig;
  final List<ImpaktfullUiTableHeaderItem> titles;
  final List<ImpaktfullUiTableRow> content;
  final bool shrinkWrap;
  final bool isLoading;
  final ImpaktfullUiTableTheme? theme;

  const ImpaktfullUiTable({
    required this.titles,
    required this.content,
    this.columnConfig = const [],
    this.shrinkWrap = false,
    this.isLoading = false,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final dividerTheme = _getDividerTheme(context, componentTheme);
        return Container(
          decoration: BoxDecoration(
            color: componentTheme.colors.background,
            borderRadius: componentTheme.dimens.borderRadius,
            border: componentTheme.colors.border == null
                ? null
                : Border.all(
                    color: componentTheme.colors.border!,
                    strokeAlign: BorderSide.strokeAlignInside,
                    width: componentTheme.dimens.borderWidth,
                  ),
          ),
          child: ClipRRect(
            borderRadius: componentTheme.dimens.borderRadius,
            child: ImpaktfullUiTableColumnConfigScope(
              columnConfig: columnConfig,
              child: _TableContainer(
                columnConfig: columnConfig,
                amountOfColumns: titles.length,
                borderRadius: componentTheme.dimens.borderRadius,
                minColumnWidth: componentTheme.dimens.minColumnWidth,
                child: ImpaktfullUiAutoLayout.vertical(
                  mainAxisSize:
                      shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
                  children: [
                    ImpaktfullUiTableHeader(
                      titles: titles,
                      columnConfig: columnConfig,
                    ),
                    ImpaktfullUiDivider(theme: dividerTheme),
                    Builder(
                      builder: (context) {
                        Widget child;
                        if (isLoading) {
                          child = const Center(
                            child: ImpaktfullUiLoadingIndicator(),
                          );
                        } else {
                          child = ListView.separated(
                            itemCount: content.length,
                            shrinkWrap: shrinkWrap,
                            itemBuilder: (context, index) =>
                                ImpaktfullUiTableRowIndexScope(
                              index: index,
                              child: content[index],
                            ),
                            separatorBuilder: (contex, index) =>
                                ImpaktfullUiDivider(theme: dividerTheme),
                          );
                        }
                        if (shrinkWrap) {
                          return child;
                        }
                        return Expanded(child: child);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// The theme of the dividers of the table: the divider theme of the theme
  /// with the `divider` color of the table, or null (the divider theme
  /// itself) when the table has no `divider` color.
  ImpaktfullUiDividerTheme? _getDividerTheme(
    BuildContext context,
    ImpaktfullUiTableTheme componentTheme,
  ) {
    final color = componentTheme.colors.divider;
    if (color == null) return null;
    final dividerTheme = ImpaktfullUiDividerTheme.of(context);
    return dividerTheme.copyWith(
      colors: dividerTheme.colors.copyWith(color: color),
    );
  }
}

class _TableContainer extends StatelessWidget {
  final List<ImpaktfullUiTableColumnConfig> columnConfig;
  final int amountOfColumns;
  final Widget child;
  final BorderRadiusGeometry borderRadius;
  final double minColumnWidth;

  const _TableContainer({
    required this.columnConfig,
    required this.amountOfColumns,
    required this.child,
    required this.borderRadius,
    required this.minColumnWidth,
  });

  @override
  Widget build(BuildContext context) {
    final minWidth = _getMinWidth();
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > minWidth) {
          return child;
        }
        if (!constraints.hasBoundedHeight) {
          // A shrinkWrap table in a scrollable parent: a horizontal ListView
          // needs a bounded height, a SingleChildScrollView takes the height
          // of the table.
          return ClipRRect(
            borderRadius: borderRadius,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: SizedBox(
                width: minWidth,
                child: child,
              ),
            ),
          );
        }
        return ClipRRect(
          borderRadius: borderRadius,
          child: SizedBox(
            height: constraints.maxHeight,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              children: [
                SizedBox(
                  width: minWidth,
                  child: child,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  double _getMinWidth() {
    if (columnConfig.isEmpty) return amountOfColumns * minColumnWidth;
    var minWidth = 0.0;
    for (var i = 0; i < amountOfColumns; ++i) {
      final tableConfig = i > columnConfig.length - 1
          ? const ImpaktfullUiTableColumnConfig(flex: 1)
          : columnConfig[i];
      if (tableConfig.minWidth != null) {
        minWidth += tableConfig.minWidth!;
      } else if (tableConfig.flex != null) {
        minWidth += minColumnWidth * tableConfig.flex!;
      } else {}
    }
    return minWidth;
  }
}
