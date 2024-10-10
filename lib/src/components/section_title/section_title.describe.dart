part of 'section_title.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiSectionTitle instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
