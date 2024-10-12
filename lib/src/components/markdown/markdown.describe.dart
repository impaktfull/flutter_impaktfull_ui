part of 'markdown.dart';

String _describeInstance(BuildContext context, ImpaktfullUiMarkdown instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}