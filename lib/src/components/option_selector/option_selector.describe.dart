part of 'option_selector.dart';

String _describeInstance<T>(
    BuildContext context, ImpaktfullUiOptionSelector<T> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
