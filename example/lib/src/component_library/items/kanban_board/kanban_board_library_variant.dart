import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/items/kanban_board/kanban_board_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/items/kanban_board/widget/kanban_board_state_configurator.dart';

class KanbanBoardLibraryVariant
    extends ComponentLibraryVariant<KanbanBoardLibraryVariantInputs> {
  const KanbanBoardLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, KanbanBoardLibraryVariantInputs inputs) {
    return [
      SizedBox(
        height: 850,
        child: KanbanBoardStateConfigurator(
          builder: (context, items, onItemMoved, onItemReordered) =>
              ImpaktfullUiKanbanBoard<String>(
            columns: const [
              ImpaktfullUiKanbanBoardColumnConfig(
                id: 'todo',
                name: 'To Do',
                color: Colors.blue,
              ),
              ImpaktfullUiKanbanBoardColumnConfig(
                id: 'in_progress',
                name: 'In Progress',
                color: Colors.orange,
              ),
              ImpaktfullUiKanbanBoardColumnConfig(
                id: 'done',
                name: 'Done',
                color: Colors.green,
              ),
            ],
            items: items,
            itemBuilder: (item) => ImpaktfullUiKanbanBoardCard<String>(
              key: ValueKey(item.id),
              item: item,
            ),
            onItemMoved: onItemMoved,
            onItemReordered: onItemReordered,
          ),
        ),
      ),
    ];
  }

  @override
  KanbanBoardLibraryVariantInputs inputs() => KanbanBoardLibraryVariantInputs();
}

class KanbanBoardLibraryVariantInputs extends KanbanBoardLibraryInputs {}
