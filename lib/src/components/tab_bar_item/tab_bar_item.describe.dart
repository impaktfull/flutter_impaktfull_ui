part of 'tab_bar_item.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiTabBarItem instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
