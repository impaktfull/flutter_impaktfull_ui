part of 'badge.dart';

String _describe(ImpaktfullUiBadge instance) {
  final sb = StringBuffer();
  sb.write('type: ${instance.type.name} / ');
  sb.write('size: ${instance.size.name} / ');
  sb.write('label: ${instance.label} / ');
  if (instance.leading != null) sb.write('leading: ${instance.leading} / ');
  if (instance.trailing != null) sb.write('trailing: ${instance.trailing} / ');
  if (instance.onTap != null) sb.write('onTap: ${instance.onTap} / ');
  if (instance.onCloseTap != null) sb.write('onCloseTap: ${instance.onCloseTap} / ');
  if (instance.theme != null) sb.write('theme: ${instance.theme} /');
  return sb.toString();
}
