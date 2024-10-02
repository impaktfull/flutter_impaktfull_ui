part of 'modal.dart';

String _describeInstance(BuildContext context, ImpaktfullUiModal instance) {
  final sb = StringBuffer();
  if (instance.theme != null) sb.write("theme: ${instance.theme}");
  return sb.toString();
}
