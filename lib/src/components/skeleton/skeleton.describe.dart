part of 'skeleton.dart';

String _describeInstance(BuildContext context, ImpaktfullUiSkeleton instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
