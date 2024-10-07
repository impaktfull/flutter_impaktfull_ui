part of 'avatar.dart';

String _describeInstance(BuildContext context, ImpaktfullUiAvatar instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('url', instance.url);
  descriptor.add('placeholderAsset', instance.placeholderAsset);
  descriptor.add('width', instance.width);
  descriptor.add('height', instance.height);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
