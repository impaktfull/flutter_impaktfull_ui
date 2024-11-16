part of 'chat.dart';

String _describeInstance(BuildContext context, ImpaktfullUiChat instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
