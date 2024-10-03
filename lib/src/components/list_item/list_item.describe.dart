part of 'list_item.dart';

String _describeInstance(BuildContext context, ImpaktfullUiListItem instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('leading', instance.leading);
  descriptor.add('title', instance.title);
  descriptor.add('subtitle', instance.subtitle);
  descriptor.add('onTap', instance.onTap);
  descriptor.add('onAsyncTap', instance.onAsyncTap);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
