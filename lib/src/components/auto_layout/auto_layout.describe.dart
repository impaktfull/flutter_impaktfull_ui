part of 'auto_layout.dart';

String _describeInstance(ImpaktfullUiAutoLayout instance) {
  final sb = StringBuffer();
  sb.write('orientation: ${instance.orientation.name} / ');
  sb.write('mainAxisAlignment: ${instance.mainAxisAlignment.name} / ');
  sb.write('mainAxisSize: ${instance.mainAxisSize.name} / ');
  sb.write('crossAxisAlignment: ${instance.crossAxisAlignment.name} / ');
  sb.write('spacing: ${instance.spacing} / ');
  sb.write('children: ${instance.children.length} /');
  return sb.toString();
}
