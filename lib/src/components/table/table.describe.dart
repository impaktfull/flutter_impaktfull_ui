part of 'table.dart';

String _describeInstance(BuildContext context, ImpaktfullUiTable instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('columnConfig', instance.columnConfig);
  descriptor.add('titles', instance.titles);
  descriptor.add('content', instance.content);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
