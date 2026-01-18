import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/kanban_board/kanban_board_card.dart';
import 'package:impaktfull_ui/src/components/kanban_board/kanban_board_style.dart';
import 'package:impaktfull_ui/src/components/kanban_board/model/kanban_board_column_config.dart';
import 'package:impaktfull_ui/src/components/kanban_board/model/kanban_board_item.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

part 'kanban_board_column.describe.dart';

class ImpaktfullUiKanbanBoardColumn<T> extends StatelessWidget
    with ComponentDescriptorMixin {
  final ImpaktfullUiKanbanBoardColumnConfig config;
  final List<ImpaktfullUiKanbanBoardItem<T>> items;
  final Widget Function(ImpaktfullUiKanbanBoardItem<T> item)? itemBuilder;
  final void Function(ImpaktfullUiKanbanBoardItem<T> item, int newIndex)?
      onItemReordered;
  final void Function(ImpaktfullUiKanbanBoardItem<T> item)? onItemDropped;
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
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(componentTheme),
              Expanded(
                child: DragTarget<ImpaktfullUiKanbanBoardItem<T>>(
                  onWillAcceptWithDetails: (details) =>
                      details.data.columnId != config.id,
                  onAcceptWithDetails: (details) {
                    onItemDropped?.call(details.data);
                  },
                  builder: (context, candidateData, rejectedData) {
                    final isHovering = candidateData.isNotEmpty;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: isHovering
                            ? config.color.withValues(alpha: 0.1)
                            : Colors.transparent,
                        borderRadius: componentTheme.dimens.columnBorderRadius,
                      ),
                      child: _buildItemsList(componentTheme),
                    );
                  },
                ),
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
        color: config.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.only(
          topLeft: componentTheme.dimens.columnBorderRadius.topLeft,
          topRight: componentTheme.dimens.columnBorderRadius.topRight,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: config.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              config.name,
              style: componentTheme.textStyles.columnTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: config.color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${items.length}',
              style: componentTheme.textStyles.columnCount?.copyWith(
                color: config.color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsList(ImpaktfullUiKanbanBoardTheme componentTheme) {
    return ReorderableListView.builder(
      padding: componentTheme.dimens.columnContentPadding,
      itemCount: items.length,
      onReorder: (oldIndex, newIndex) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        if (oldIndex != newIndex) {
          onItemReordered?.call(items[oldIndex], newIndex);
        }
      },
      proxyDecorator: (child, index, animation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            final double elevation =
                Tween<double>(begin: 0, end: 8).evaluate(animation);
            return Material(
              elevation: elevation,
              color: Colors.transparent,
              borderRadius: componentTheme.dimens.cardBorderRadius,
              child: child,
            );
          },
          child: child,
        );
      },
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          key: ValueKey(item.id),
          padding: EdgeInsets.only(
            bottom: index < items.length - 1
                ? componentTheme.dimens.itemSpacing
                : 0,
          ),
          child: LongPressDraggable<ImpaktfullUiKanbanBoardItem<T>>(
            data: item,
            feedback: Material(
              elevation: 8,
              borderRadius: componentTheme.dimens.cardBorderRadius,
              child: SizedBox(
                width: componentTheme.dimens.columnWidth -
                    componentTheme.dimens.columnContentPadding.horizontal,
                child: itemBuilder?.call(item) ??
                    ImpaktfullUiKanbanBoardCard<T>(
                      item: item,
                      theme: theme,
                    ),
              ),
            ),
            childWhenDragging: Opacity(
              opacity: 0.5,
              child: itemBuilder?.call(item) ??
                  ImpaktfullUiKanbanBoardCard<T>(
                    item: item,
                    theme: theme,
                  ),
            ),
            child: itemBuilder?.call(item) ??
                ImpaktfullUiKanbanBoardCard<T>(
                  item: item,
                  theme: theme,
                ),
          ),
        );
      },
    );
  }

  @override
  String describe(BuildContext context) =>
      _describeColumnInstance(context, this);
}
