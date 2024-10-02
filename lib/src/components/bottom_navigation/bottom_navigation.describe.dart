part of 'bottom_navigation.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiBottomNavigation instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('items', instance.items);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
