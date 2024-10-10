part of 'loading_error_data.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiLoadingErrorData instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
