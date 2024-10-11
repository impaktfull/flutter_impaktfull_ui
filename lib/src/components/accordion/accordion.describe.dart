part of 'accordion.dart';

String _describeInstance(BuildContext context, ImpaktfullUiAccordion instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
