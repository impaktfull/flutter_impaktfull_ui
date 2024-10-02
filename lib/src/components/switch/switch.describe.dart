part of 'switch.dart';

String _describeInstance(BuildContext context, ImpaktfullUiSwitch instance) {
  final sb = StringBuffer();
  sb.write("value: ${instance.value} / ");
  if (MediaQuery.of(context).accessibleNavigation) {
    sb.write("accessibleNavigation: true / ");
  }
  if (instance.theme != null) sb.write("theme: ${instance.theme} / ");
  return sb.toString();
}
