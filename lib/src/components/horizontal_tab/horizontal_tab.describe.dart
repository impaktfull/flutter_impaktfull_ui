part of 'horizontal_tab.dart';

String _describeInstance(ImpaktfullUiHorizontalTab instance) {
  final sb = StringBuffer();

  sb.write("label: ${instance.label}");
  if (instance.badge != null) sb.write("badge: ${instance.badge}");
  sb.write("badgeType: ${instance.badgeType}");
  sb.write("isSelected: ${instance.isSelected}");
  return sb.toString();
}
