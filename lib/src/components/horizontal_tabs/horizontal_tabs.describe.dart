part of 'horizontal_tabs.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiHorizontalTabs instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('selectedValue', instance.selectedValue);
  descriptor.add('onTabSelected', instance.onTabSelected);
  descriptor.add('tabs', instance.tabs);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
