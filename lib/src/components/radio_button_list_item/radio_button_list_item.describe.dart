part of 'radio_button_list_item.dart';

String _describeInstance<T>(
    BuildContext context, ImpaktfullUiRadioButtonListItem<T> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
