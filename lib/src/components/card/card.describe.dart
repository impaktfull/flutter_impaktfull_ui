part of 'card.dart';

String _describeInstance(BuildContext context, ImpaktfullUiCard instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('child', instance.child);
  descriptor.add('cursor', instance.cursor);
  descriptor.add('onTap', instance.onTap);
  descriptor.add('onFocus', instance.onFocus);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
