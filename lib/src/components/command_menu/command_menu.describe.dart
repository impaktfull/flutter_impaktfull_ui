part of 'command_menu.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiCommandMenu instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
