part of 'auto_complete.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiAutoComplete instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
