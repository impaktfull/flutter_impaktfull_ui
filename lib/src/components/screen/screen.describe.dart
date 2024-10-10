part of 'screen.dart';

String _describeInstance(BuildContext context, ImpaktfullUiScreen instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
