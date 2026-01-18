part of 'kanban_board_card.dart';

String _describeCardInstance<T>(
    BuildContext context, ImpaktfullUiKanbanBoardCard<T> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('item', instance.item);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
