part of 'badge.dart';

String _describeInstance(BuildContext context, ImpaktfullUiBadge instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('type', instance.type.name);
  descriptor.add('size', instance.size.name);
  descriptor.add('label', instance.label);
  descriptor.add('leading', instance.leading);
  descriptor.add('trailing', instance.trailing);
  descriptor.add('onTap', instance.onTap);
  descriptor.add('onCloseTap', instance.onCloseTap);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
