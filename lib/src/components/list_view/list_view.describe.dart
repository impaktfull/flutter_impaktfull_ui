part of 'list_view.dart';

String _describeInstance(BuildContext context, ImpaktfullUiListView instance) {
  final sb = StringBuffer();
  if (instance.child != null) sb.write("child: ${instance.child} / ");
  if (instance.children != null) {
    sb.write("children: ${instance.children?.length} / ");
  }
  if (instance.items != null) sb.write("items: ${instance.items?.length} / ");
  if (instance.itemBuilder != null) {
    sb.write("itemBuilder: ${instance.itemBuilder}");
  }
  sb.write("padding: ${instance.padding}");
  sb.write("spacing: ${instance.spacing}");
  sb.write("separated: ${instance.separated}");
  sb.write("noDataLabel: ${instance.noDataLabel}");
  sb.write("refreshBtnLabel: ${instance.refreshBtnLabel}");
  sb.write("isLoading: ${instance.isLoading}");
  sb.write("onRefresh: ${instance.onRefresh}");
  if (instance.theme != null) sb.write("theme: ${instance.theme}");
  return sb.toString();
}
