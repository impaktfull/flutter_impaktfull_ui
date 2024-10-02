part of 'cms_header.dart';

String _describeInstance(BuildContext context, ImpaktfullUiCmsHeader instance) {
  final sb = StringBuffer();
  sb.write('title: ${instance.title} / ');
  if (instance.subtitle != null) sb.write('subtitle: ${instance.subtitle} / ');
  if (instance.onBackTapped != null) {
    sb.write('onBackTapped: ${instance.onBackTapped} / ');
  }
  if (instance.actions.isNotEmpty) {
    sb.write('actions: ${instance.actions.length} / ');
  }
  if (instance.bottom != null) sb.write('bottom: ${instance.bottom} / ');
  if (instance.badge != null) sb.write('badge: ${instance.badge} / ');
  if (instance.theme != null) sb.write('theme: ${instance.theme} / ');
  return sb.toString();
}
