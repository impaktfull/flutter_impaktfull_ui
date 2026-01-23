import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/kanban_board/kanban_board_card.dart';
import 'package:impaktfull_ui/src/components/kanban_board/kanban_board_style.dart';
import 'package:impaktfull_ui/src/components/kanban_board/model/kanban_board_column_config.dart';
import 'package:impaktfull_ui/src/components/kanban_board/model/kanban_board_item.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiKanbanBoardColumn<T> extends StatefulWidget {
  final ImpaktfullUiKanbanBoardColumnConfig config;
  final List<ImpaktfullUiKanbanBoardItem<T>> items;
  final Widget Function(ImpaktfullUiKanbanBoardItem<T> item)? itemBuilder;
  final void Function(ImpaktfullUiKanbanBoardItem<T> item, int newIndex)?
      onItemReordered;
  final void Function(ImpaktfullUiKanbanBoardItem<T> item, int targetIndex)?
      onItemDropped;
  final ImpaktfullUiKanbanBoardTheme? theme;

  const ImpaktfullUiKanbanBoardColumn({
    required this.config,
    required this.items,
    this.itemBuilder,
    this.onItemReordered,
    this.onItemDropped,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiKanbanBoardColumn<T>> createState() =>
      _ImpaktfullUiKanbanBoardColumnState<T>();
}

class _ImpaktfullUiKanbanBoardColumnState<T>
    extends State<ImpaktfullUiKanbanBoardColumn<T>> {
  int? _dragTargetIndex;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        return Container(
          width: componentTheme.dimens.columnWidth,
          decoration: BoxDecoration(
            color: componentTheme.colors.columnBackground,
            borderRadius: componentTheme.dimens.columnBorderRadius,
            border: componentTheme.colors.columnBorder != null
                ? Border.all(
                    color: componentTheme.colors.columnBorder!,
                    width: componentTheme.dimens.columnBorderWidth,
                  )
                : null,
          ),
          child: ImpaktfullUiAutoLayout.vertical(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(componentTheme),
              Expanded(
                child: _buildItemsList(componentTheme),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(ImpaktfullUiKanbanBoardTheme componentTheme) {
    return Container(
      padding: componentTheme.dimens.columnHeaderPadding,
      decoration: BoxDecoration(
        color: widget.config.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.only(
          topLeft: componentTheme.dimens.columnBorderRadius.topLeft,
          topRight: componentTheme.dimens.columnBorderRadius.topRight,
        ),
      ),
      child: ImpaktfullUiAutoLayout.horizontal(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: widget.config.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.config.name,
              style: componentTheme.textStyles.columnTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: widget.config.color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              widget.items.length.toString(),
              style: componentTheme.textStyles.columnCount?.copyWith(
                color: widget.config.color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsList(ImpaktfullUiKanbanBoardTheme componentTheme) {
    return DragTarget<ImpaktfullUiKanbanBoardItem<T>>(
      onWillAcceptWithDetails: (details) => true,
      onAcceptWithDetails: (details) {
        final targetIndex = _dragTargetIndex ?? widget.items.length;
        if (details.data.columnId == widget.config.id) {
          // Reordering within the same column
          final oldIndex =
              widget.items.indexWhere((item) => item.id == details.data.id);
          if (oldIndex != -1 && oldIndex != targetIndex) {
            widget.onItemReordered?.call(details.data, targetIndex);
          }
        } else {
          // Moving from another column
          widget.onItemDropped?.call(details.data, targetIndex);
        }
        setState(() {
          _dragTargetIndex = null;
        });
      },
      onLeave: (data) {
        setState(() {
          _dragTargetIndex = null;
        });
      },
      onMove: (details) {
        // Calculate which index the item would be dropped at
        final RenderBox box = context.findRenderObject() as RenderBox;
        final localPosition = box.globalToLocal(details.offset);
        final headerHeight =
            componentTheme.dimens.columnHeaderPadding.vertical +
                24; // approximate header height
        final contentTop =
            headerHeight + componentTheme.dimens.columnContentPadding.top;
        final itemHeight = 80 + componentTheme.dimens.itemSpacing;

        final newIndex =
            ((localPosition.dy - contentTop) / itemHeight).floor().clamp(
                  0,
                  widget.items.length,
                );

        if (_dragTargetIndex != newIndex) {
          setState(() {
            _dragTargetIndex = newIndex;
          });
        }
      },
      builder: (context, candidateData, rejectedData) {
        final isHovering = candidateData.isNotEmpty;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isHovering
                ? widget.config.color.withValues(alpha: 0.05)
                : Colors.transparent,
            borderRadius: componentTheme.dimens.columnBorderRadius,
          ),
          child: ListView.builder(
            padding: componentTheme.dimens.columnContentPadding,
            itemCount: widget.items.length +
                (isHovering && _dragTargetIndex != null ? 1 : 0),
            itemBuilder: (context, index) {
              // Show drop indicator
              if (isHovering &&
                  _dragTargetIndex != null &&
                  index == _dragTargetIndex) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: componentTheme.dimens.itemSpacing),
                  child: Container(
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: widget.config.color,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }

              // Adjust index if drop indicator is shown before this item
              final itemIndex = isHovering &&
                      _dragTargetIndex != null &&
                      index > _dragTargetIndex!
                  ? index - 1
                  : index;

              if (itemIndex >= widget.items.length) return const SizedBox();

              final item = widget.items[itemIndex];
              final isDraggedItem = candidateData.isNotEmpty &&
                  candidateData.first?.id == item.id;
              final itemWidget = _itemBuilder(item);
              return Padding(
                padding: EdgeInsets.only(
                  bottom: itemIndex < widget.items.length - 1
                      ? componentTheme.dimens.itemSpacing
                      : 0,
                ),
                child: Draggable<ImpaktfullUiKanbanBoardItem<T>>(
                  data: item,
                  feedback: Material(
                    elevation: 8,
                    borderRadius: componentTheme.dimens.cardBorderRadius,
                    child: SizedBox(
                      width: componentTheme.dimens.columnWidth -
                          componentTheme.dimens.columnContentPadding.horizontal,
                      child: itemWidget,
                    ),
                  ),
                  childWhenDragging: Opacity(
                    opacity: 0.3,
                    child: itemWidget,
                  ),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isDraggedItem ? 0.3 : 1.0,
                    child: itemWidget,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _itemBuilder(ImpaktfullUiKanbanBoardItem<T> item) =>
      widget.itemBuilder?.call(item) ??
      ImpaktfullUiKanbanBoardCard<T>(
        item: item,
        theme: widget.theme,
      );
}
