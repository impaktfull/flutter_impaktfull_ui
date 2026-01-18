import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/items/kanban_board/kanban_board_library_item.dart';

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
        height: 500,
        child: ImpaktfullUiKanbanBoard<String>(
          columns: const [
            ImpaktfullUiKanbanBoardColumnConfig(
              id: 'todo',
              name: 'To Do',
              color: Colors.blue,
              index: 0,
            ),
            ImpaktfullUiKanbanBoardColumnConfig(
              id: 'in_progress',
              name: 'In Progress',
              color: Colors.orange,
              index: 1,
            ),
            ImpaktfullUiKanbanBoardColumnConfig(
              id: 'done',
              name: 'Done',
              color: Colors.green,
              index: 2,
            ),
          ],
          items: const [
            ImpaktfullUiKanbanBoardItem(
              id: '1',
              columnId: 'todo',
              title: 'Design new feature',
              description:
                  'Create wireframes and mockups for the new dashboard',
            ),
            ImpaktfullUiKanbanBoardItem(
              id: '2',
              columnId: 'todo',
              title: 'Write documentation',
              description: 'Document the API endpoints',
              imageUrl: 'https://picsum.photos/300/200',
            ),
            ImpaktfullUiKanbanBoardItem(
              id: '3',
              columnId: 'in_progress',
              title: 'Implement login',
              description: 'Add OAuth2 authentication flow',
            ),
            ImpaktfullUiKanbanBoardItem(
              id: '4',
              columnId: 'done',
              title: 'Setup project',
              description: 'Initialize repository and CI/CD',
            ),
          ],
          onItemMoved: (item, fromColumn, toColumn, newIndex) {
            debugPrint(
                'Item ${item.title} moved from $fromColumn to $toColumn at index $newIndex');
          },
          onItemReordered: (item, oldIndex, newIndex) {
            debugPrint(
                'Item ${item.title} reordered from $oldIndex to $newIndex');
          },
        ),
      ),
    ];
  }

  @override
  KanbanBoardLibraryVariantInputs inputs() => KanbanBoardLibraryVariantInputs();
}

class KanbanBoardLibraryVariantInputs extends KanbanBoardLibraryInputs {}
