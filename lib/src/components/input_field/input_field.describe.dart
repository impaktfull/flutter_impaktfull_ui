part of 'input_field.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiInputField instance) {
  final sb = StringBuffer();
  if (instance.label != null) sb.write("label: ${instance.label} / ");
  if (instance.hint != null) sb.write("hint: ${instance.hint} / ");
  if (instance.leadingIcon != null) {
    sb.write("leadingIcon: ${instance.leadingIcon} / ");
  }
  if (instance.value != null) sb.write("value: ${instance.value} / ");
  if (instance.controller != null) {
    sb.write("controller: ${instance.controller} / ");
  }
  sb.write("obscureText: ${instance.obscureText} / ");
  sb.write("textInputType: ${instance.textInputType} / ");
  sb.write("textInputAction: ${instance.textInputAction} / ");
  if (instance.theme != null) sb.write("theme: ${instance.theme} / ");
  return sb.toString();
}
