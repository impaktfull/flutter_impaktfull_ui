part of 'list_item.dart';

String _describeInstance(BuildContext context, ImpaktfullUiListItem instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
