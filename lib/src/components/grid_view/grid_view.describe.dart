part of 'grid_view.dart';

String _describeInstance<T>(
    BuildContext context, ImpaktfullUiGridView<T> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
