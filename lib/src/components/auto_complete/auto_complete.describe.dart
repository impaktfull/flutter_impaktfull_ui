part of 'auto_complete.dart';

String _describeInstance<T>(
    BuildContext context, ImpaktfullUiAutoComplete<T> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
