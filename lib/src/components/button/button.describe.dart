part of 'button.dart';

String _describeInstance(BuildContext context, ImpaktfullUiButton instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('type', instance.type.name);
  descriptor.add('size', instance.size.name);
  descriptor.add('title', instance.title);
  descriptor.add('leadingIcon', instance.leadingAsset);
  descriptor.add('leadingChild', instance.leadingChild);
  descriptor.add('trailingIcon', instance.trailingAsset);
  descriptor.add('trailingChild', instance.trailingChild);
  descriptor.add('isLoading', instance.isLoading);
  descriptor.add('fullWidth', instance.fullWidth);
  descriptor.add('onTap', instance.onTap);
  descriptor.add('onAsyncTap', instance.onAsyncTap);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
