part of 'checkbox.dart';

String _describeInstance(ImpaktfullUiCheckBox instance) {
  final sb = StringBuffer();
  sb.write('value: ${instance.value} / ');
  sb.write('onChanged: ${instance.onChanged} / ');
  if (instance.theme != null) sb.write('theme: ${instance.theme} / ');
  return sb.toString();
}
