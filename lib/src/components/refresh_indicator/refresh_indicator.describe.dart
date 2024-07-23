part of 'refresh_indicator.dart';

String _describeInstance(ImpaktfullUiRefreshIndicator instance) {
  final sb = StringBuffer();
  sb.write("child: ${instance.child}");
  sb.write("onRefresh: ${instance.onRefresh}");
  if (instance.theme != null) sb.write("theme: ${instance.theme}");
  return sb.toString();
}
