part of 'auto_layout.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiAutoLayout instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('orientation', instance.orientation.name);
  descriptor.add('mainAxisAlignment', instance.mainAxisAlignment.name);
  descriptor.add('mainAxisSize', instance.mainAxisSize.name);
  descriptor.add('crossAxisAlignment', instance.crossAxisAlignment.name);
  descriptor.add('spacing', instance.spacing);
  descriptor.add('children', instance.children);
  return descriptor.describe();
}
