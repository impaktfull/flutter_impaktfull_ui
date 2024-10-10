part of 'tab_bar.dart';

String _describeInstance(BuildContext context, ImpaktfullUiTabBar instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
