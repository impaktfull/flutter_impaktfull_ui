part of 'selectable_list_item.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiSelectableListItem instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
