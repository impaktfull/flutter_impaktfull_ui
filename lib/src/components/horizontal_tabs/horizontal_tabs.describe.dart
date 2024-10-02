part of 'horizontal_tabs.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiHorizontalTabs instance) {
  final sb = StringBuffer();
  sb.write("selectedValue: ${instance.selectedValue} / ");
  sb.write("onTabSelected: ${instance.onTabSelected} / ");
  sb.write("tabs: ${instance.tabs.length} / ");
  if (instance.theme != null) sb.write("theme: ${instance.theme} / ");
  return sb.toString();
}
