part of 'dropdown.dart';

String _describeInstance(ImpaktfullUiDropdown instance) {
  final sb = StringBuffer();
  if (instance.childWidth != null) sb.write("childWidth: ${instance.childWidth}");
  if (instance.height != null) sb.write("height: ${instance.height}");
  if (instance.child != null) sb.write("child: ${instance.child}");
  if (instance.button != null) sb.write("button: ${instance.button}");
  if (instance.items != null) sb.write("items: ${instance.items?.length}");
  if (instance.itemBuilder != null) sb.write("itemBuilder: ${instance.itemBuilder}");
  if (instance.noDataLabel != null) sb.write("noDataLabel: ${instance.noDataLabel}");
  sb.write("alignment: ${instance.alignment}");
  if (instance.theme != null) sb.write("theme: ${instance.theme}");
  return sb.toString();
}
