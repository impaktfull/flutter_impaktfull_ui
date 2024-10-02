part of 'grid_view.dart';

String _describeInstance(BuildContext context, ImpaktfullUiGridView instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
