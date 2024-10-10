part of 'separated_column.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiSeparatedColumn instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
