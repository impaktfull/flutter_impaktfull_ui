part of 'kanban_board.dart';

String _describeInstance<T>(
    BuildContext context, ImpaktfullUiKanbanBoard<T> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('columns', instance.columns);
  descriptor.add('items', instance.items);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
