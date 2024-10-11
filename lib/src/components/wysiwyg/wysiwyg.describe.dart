part of 'wysiwyg.dart';

String _describeInstance(BuildContext context, ImpaktfullUiWysiwyg instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}