part of 'virtual_keyboard.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiVirtualKeyboard instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
