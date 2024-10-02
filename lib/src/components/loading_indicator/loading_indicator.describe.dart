part of 'loading_indicator.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiLoadingIndicator instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('asset', instance.asset);
  descriptor.add('color', instance.color);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
