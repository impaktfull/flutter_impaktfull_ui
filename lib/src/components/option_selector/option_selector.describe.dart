part of 'option_selector.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiOptionSelector instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
