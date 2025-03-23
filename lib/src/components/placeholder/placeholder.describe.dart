part of 'placeholder.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiPlaceholder instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
