part of 'cms_header.dart';

String _describeInstance(BuildContext context, ImpaktfullUiCmsHeader instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('title', instance.title);
  descriptor.add('subtitle', instance.subtitle);
  descriptor.add('onBackTapped', instance.onBackTapped);
  descriptor.add('actions', instance.actions);
  descriptor.add('bottom', instance.bottom);
  descriptor.add('badge', instance.badge);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
