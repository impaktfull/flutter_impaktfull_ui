part of 'simple_list_item.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiSimpleListItem instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('title', instance.title);
  descriptor.add('subtitle', instance.subtitle);
  descriptor.add('leadingWidgetBuilder', instance.leadingWidgetBuilder);
  descriptor.add('trailingWidgetBuilder', instance.trailingWidgetBuilder);
  descriptor.add('centerWidgetBuilder', instance.centerWidgetBuilder);
  descriptor.add('onTap', instance.onTap);
  descriptor.add('spacing', instance.spacing);
  descriptor.add('type', instance.type);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
