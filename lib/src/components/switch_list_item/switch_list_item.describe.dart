part of 'switch_list_item.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiSwitchListItem instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
