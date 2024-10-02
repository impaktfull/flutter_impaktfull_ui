part of 'tooltip.dart';

String _describeInstance(BuildContext context, ImpaktfullUiTooltip instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('message', instance.message);
  descriptor.add('child', instance.child);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
