part of 'simple_list_item.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiSimpleListItem instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
