import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui/src/components/table/table.dart';
import 'package:impaktfull_ui/src/components/table/table_column_config.dart';
import 'package:impaktfull_ui/src/components/table_header/table_header.dart';
import 'package:impaktfull_ui/src/components/table_header_item/table_header_item.dart';
import 'package:impaktfull_ui/src/components/table_row/table_row.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'table_style.dart';

part 'table.describe.dart';

class ImpaktfullUiTable extends StatelessWidget with ComponentDescriptorMixin {
  final List<TableColumnConfig> columnConfig;
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
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiTableTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Container(
        decoration: BoxDecoration(
          color: componentTheme.colors.background,
          borderRadius: componentTheme.dimens.borderRadius,
          border: componentTheme.colors.border == null
              ? null
              : Border.all(
                  color: componentTheme.colors.border!,
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 1,
                ),
        ),
        child: ClipRRect(
          borderRadius: componentTheme.dimens.borderRadius,
          child: _TableContainer(
            columnConfig: columnConfig,
            amountOfColumns: titles.length,
            borderRadius: componentTheme.dimens.borderRadius,
            child: ImpaktfullUiAutoLayout.vertical(
              mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
              children: [
                ImpaktfullUiTableHeader(
                  titles: titles,
                  columnConfig: columnConfig,
                ),
                const ImpaktfullUiDivider(),
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
                        itemBuilder: (context, index) => content[index],
                        separatorBuilder: (contex, index) =>
                            const ImpaktfullUiDivider(),
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
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _TableContainer extends StatelessWidget {
  final List<TableColumnConfig> columnConfig;
  final int amountOfColumns;
  final Widget child;
  final BorderRadiusGeometry borderRadius;

  const _TableContainer({
    required this.columnConfig,
    required this.amountOfColumns,
    required this.child,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final minWidth = _getMinWidth();
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > minWidth) {
          return child;
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
    const minWidthColumn = 250.0;
    if (columnConfig.isEmpty) return amountOfColumns * minWidthColumn;
    var minWidth = 0.0;
    for (var i = 0; i < amountOfColumns; ++i) {
      final tableConfig = i > columnConfig.length - 1
          ? const TableColumnConfig(flex: 1)
          : columnConfig[i];
      if (tableConfig.minWidth != null) {
        minWidth += tableConfig.minWidth!;
      } else if (tableConfig.flex != null) {
        minWidth += minWidthColumn * tableConfig.flex!;
      } else {}
    }
    return minWidth;
  }
}
