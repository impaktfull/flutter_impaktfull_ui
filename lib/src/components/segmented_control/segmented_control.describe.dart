part of 'segmented_control.dart';

String _describeInstance<T>(
    BuildContext context, ImpaktfullUiSegmentedControl<T> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
