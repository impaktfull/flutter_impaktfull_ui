part of 'pagination.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiPagination instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('itemsPerPage', instance.itemsPerPage);
  descriptor.add('page', instance.page);
  descriptor.add('theme', instance.onLoadPage);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
