part of 'button.dart';

String _describeInstance(BuildContext context, ImpaktfullUiButton instance) {
  final sb = StringBuffer();
  sb.write('type: ${instance.type.name} / ');
  sb.write('size: ${instance.size.name} / ');
  if (instance.title != null) sb.write('title: ${instance.title} / ');
  if (instance.leadingIcon != null) {
    sb.write('leadingIcon: ${instance.leadingIcon} / ');
  }
  if (instance.leadingChild != null) {
    sb.write('leadingChild: ${instance.leadingChild} / ');
  }
  if (instance.trailingIcon != null) {
    sb.write('trailingIcon: ${instance.trailingIcon} / ');
  }
  if (instance.trailingChild != null) {
    sb.write('trailingChild: ${instance.trailingChild} / ');
  }
  sb.write('isLoading: ${instance.isLoading} / ');
  sb.write('fullWidth: ${instance.fullWidth} / ');
  if (instance.onTap != null) sb.write('onTap: ${instance.onTap} / ');
  if (instance.onAsyncTap != null) {
    sb.write('onAsyncTap: ${instance.onAsyncTap} / ');
  }
  if (instance.theme != null) sb.write('theme: ${instance.theme} /');
  return sb.toString();
}
