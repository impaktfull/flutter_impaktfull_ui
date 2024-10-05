part of 'pagination.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiPagination instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
