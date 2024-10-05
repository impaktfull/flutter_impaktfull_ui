part of 'network_image.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiNetworkImage instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
