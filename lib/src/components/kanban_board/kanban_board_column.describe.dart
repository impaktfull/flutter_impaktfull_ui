part of 'kanban_board_column.dart';

String _describeColumnInstance<T>(
    BuildContext context, ImpaktfullUiKanbanBoardColumn<T> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('config', instance.config);
  descriptor.add('items', instance.items);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
