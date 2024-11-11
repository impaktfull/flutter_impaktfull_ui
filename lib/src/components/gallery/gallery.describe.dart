part of 'gallery.dart';

String _describeInstance(BuildContext context, ImpaktfullUiGallery instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}