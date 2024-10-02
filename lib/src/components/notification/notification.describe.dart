part of 'notification.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiNotification instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('type', instance.type);
  descriptor.add('title', instance.title);
  descriptor.add('subtitle', instance.subtitle);
  descriptor.add('alignment', instance..alignment);
  descriptor.add('bottomWidgetBuilder', instance.bottomWidgetBuilder);
  descriptor.add('leadingWidgetBuilder', instance.leadingWidgetBuilder);
  descriptor.add('trailingWidgetBuilder', instance.trailingWidgetBuilder);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
