part of 'modal.dart';

String _describeInstance(BuildContext context, ImpaktfullUiModal instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('title', instance.title);
  descriptor.add('subtitle', instance.subtitle);
  descriptor.add('hasClose', instance.hasClose);
  descriptor.add('headerIcon', instance.headerIcon);
  descriptor.add('isDismissible', instance.isDismissible);
  descriptor.add('showDividers', instance.showDividers);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
