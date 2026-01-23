import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/kanban_board/kanban_board_column.dart';
import 'package:impaktfull_ui/src/components/kanban_board/kanban_board_style.dart';
import 'package:impaktfull_ui/src/components/kanban_board/model/kanban_board_column_config.dart';
import 'package:impaktfull_ui/src/components/kanban_board/model/kanban_board_item.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'kanban_board_card.dart';
export 'kanban_board_column.dart';
export 'kanban_board_style.dart';
export 'model/kanban_board_column_config.dart';
export 'model/kanban_board_item.dart';

class ImpaktfullUiKanbanBoard<T> extends StatefulWidget {
  final List<ImpaktfullUiKanbanBoardColumnConfig> columns;
  final List<ImpaktfullUiKanbanBoardItem<T>> items;
  final Widget Function(ImpaktfullUiKanbanBoardItem<T> item)? itemBuilder;
  final void Function(
    ImpaktfullUiKanbanBoardItem<T> item,
    String fromColumnId,
    String toColumnId,
    int newIndex,
  )? onItemMoved;
  final void Function(
    ImpaktfullUiKanbanBoardItem<T> item,
    int oldIndex,
    int newIndex,
  )? onItemReordered;
  final ImpaktfullUiKanbanBoardTheme? theme;

  const ImpaktfullUiKanbanBoard({
    required this.columns,
    required this.items,
    this.itemBuilder,
    this.onItemMoved,
    this.onItemReordered,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiKanbanBoard<T>> createState() =>
      _ImpaktfullUiKanbanBoardState<T>();
}

class _ImpaktfullUiKanbanBoardState<T>
    extends State<ImpaktfullUiKanbanBoard<T>> {
  List<ImpaktfullUiKanbanBoardItem<T>> _getItemsForColumn(String columnId) =>
      widget.items.where((item) => item.columnId == columnId).toList();

  void _handleItemDropped(
    ImpaktfullUiKanbanBoardItem<T> item,
    String targetColumnId,
    int targetIndex,
  ) {
    if (item.columnId == targetColumnId) return;
    widget.onItemMoved?.call(
      item,
      item.columnId,
      targetColumnId,
      targetIndex,
    );
  }

  void _handleItemReordered(
    ImpaktfullUiKanbanBoardItem<T> item,
    int newIndex,
    String columnId,
  ) {
    final columnItems = _getItemsForColumn(columnId);
    final oldIndex = columnItems.indexWhere((i) => i.id == item.id);
    if (oldIndex != -1 && oldIndex != newIndex) {
      widget.onItemReordered?.call(item, oldIndex, newIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: componentTheme.dimens.boardPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final column in widget.columns) ...[
                SizedBox(
                  height: constraints.maxHeight -
                      componentTheme.dimens.boardPadding.vertical,
                  child: ImpaktfullUiKanbanBoardColumn<T>(
                    config: column,
                    items: _getItemsForColumn(column.id),
                    itemBuilder: widget.itemBuilder,
                    theme: widget.theme,
                    onItemReordered: (item, newIndex) {
                      _handleItemReordered(item, newIndex, column.id);
                    },
                    onItemDropped: (item, targetIndex) {
                      _handleItemDropped(item, column.id, targetIndex);
                    },
                  ),
                ),
                if (column != widget.columns.last)
                  SizedBox(width: componentTheme.dimens.columnSpacing),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
