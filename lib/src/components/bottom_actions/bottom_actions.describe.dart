part of 'bottom_actions.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiBottomActions instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
