part of 'divider.dart';

String _describeInstance(BuildContext context, ImpaktfullUiDivider instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
