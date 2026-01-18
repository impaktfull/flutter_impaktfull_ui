import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/items/kanban_board/kanban_board_library_variant.dart';

class KanbanBoardLibraryItem extends ComponentLibraryItem {
  const KanbanBoardLibraryItem();

  @override
  String get title => 'ImpaktfullUiKanbanBoard';

  @override
  List<ComponentLibraryVariant> getComponentVariants() => [
        const KanbanBoardLibraryVariant(),
      ];
}

class KanbanBoardLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
