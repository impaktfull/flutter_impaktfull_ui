part of 'loading_indicator.dart';

String _describeInstance(ImpaktfullUiLoadingIndicator instance) {
  final sb = StringBuffer();
  sb.write("asset: ${instance.asset}");
  sb.write("color: ${instance.color}");
  if (instance.theme != null) sb.write("theme: ${instance.theme}");
  return sb.toString();
}
