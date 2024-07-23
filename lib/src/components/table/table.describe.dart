part of 'table.dart';

String _describeInstance(ImpaktfullUiTable instance) {
  final sb = StringBuffer();
  sb.write("columnConfig: ${instance.columnConfig} / ");
  sb.write("titles: ${instance.titles.length} / ");
  sb.write("content: ${instance.content.length} / ");
  if (instance.theme != null) sb.write("theme: ${instance.theme} / ");
  return sb.toString();
}
