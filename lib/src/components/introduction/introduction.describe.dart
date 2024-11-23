part of 'introduction.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiIntroduction instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
