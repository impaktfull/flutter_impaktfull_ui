part of 'progress_indicator.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiProgressIndicator instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
