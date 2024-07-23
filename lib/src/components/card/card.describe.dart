part of 'card.dart';

String _describeInstance(ImpaktfullUiCard instance) {
  final sb = StringBuffer();
  sb.write('child: ${instance.child} / ');
  sb.write('cursor: ${instance.cursor} / ');
  if (instance.onTap != null) sb.write('onTap: ${instance.onTap} / ');
  if (instance.onFocus != null) sb.write('onFocus: ${instance.onFocus} / ');
  if (instance.theme != null) sb.write('theme: ${instance.theme} /');
  return sb.toString();
}
