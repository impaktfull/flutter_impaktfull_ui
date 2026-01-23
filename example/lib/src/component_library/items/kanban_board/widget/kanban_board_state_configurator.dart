import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class KanbanBoardStateConfigurator extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    List<ImpaktfullUiKanbanBoardItem<String>> items,
    void Function(
      ImpaktfullUiKanbanBoardItem<String> item,
      String fromColumnId,
      String toColumnId,
      int newIndex,
    ) onItemMoved,
    void Function(
      ImpaktfullUiKanbanBoardItem<String> item,
      int oldIndex,
      int newIndex,
    ) onItemReordered,
  ) builder;

  const KanbanBoardStateConfigurator({
    required this.builder,
    super.key,
  });

  @override
  State<KanbanBoardStateConfigurator> createState() =>
      _KanbanBoardStateConfiguratorState();
}

class _KanbanBoardStateConfiguratorState
    extends State<KanbanBoardStateConfigurator> {
  late List<ImpaktfullUiKanbanBoardItem<String>> _items;

  @override
  void initState() {
    super.initState();
    _items = [
      const ImpaktfullUiKanbanBoardItem(
        id: '1',
        columnId: 'todo',
        title: 'Design new feature',
        description: 'Create wireframes and mockups for the new dashboard',
      ),
      const ImpaktfullUiKanbanBoardItem(
        id: '2',
        columnId: 'todo',
        title: 'Write documentation',
        description: 'Document the API endpoints',
        imageUrl: 'https://picsum.photos',
      ),
      const ImpaktfullUiKanbanBoardItem(
        id: '3',
        columnId: 'in_progress',
        title: 'Implement login',
        description: 'Add OAuth2 authentication flow',
      ),
      const ImpaktfullUiKanbanBoardItem(
        id: '4',
        columnId: 'done',
        title: 'Setup project',
        description: 'Initialize repository and CI/CD',
      ),
    ];
  }

  void _onItemMoved(
    ImpaktfullUiKanbanBoardItem<String> item,
    String fromColumnId,
    String toColumnId,
    int newIndex,
  ) {
    setState(() {
      final itemIndex = _items.indexWhere((i) => i.id == item.id);
      if (itemIndex != -1) {
        _items[itemIndex] = ImpaktfullUiKanbanBoardItem(
          id: item.id,
          columnId: toColumnId,
          title: item.title,
          description: item.description,
          imageUrl: item.imageUrl,
          data: item.data,
        );
      }
    });
    debugPrint(
        'Item ${item.title} moved from $fromColumnId to $toColumnId at index $newIndex');
  }

  void _onItemReordered(
    ImpaktfullUiKanbanBoardItem<String> item,
    int oldIndex,
    int newIndex,
  ) {
    setState(() {
      final columnItems =
          _items.where((i) => i.columnId == item.columnId).toList();
      final movedItem = columnItems.removeAt(oldIndex);
      columnItems.insert(
          newIndex > oldIndex ? newIndex - 1 : newIndex, movedItem);

      // Rebuild the full list maintaining column order
      final otherItems =
          _items.where((i) => i.columnId != item.columnId).toList();
      _items = [...otherItems, ...columnItems];
    });
    debugPrint('Item ${item.title} reordered from $oldIndex to $newIndex');
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _items,
      _onItemMoved,
      _onItemReordered,
    );
  }
}
