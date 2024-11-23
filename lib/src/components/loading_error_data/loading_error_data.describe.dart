part of 'loading_error_data.dart';

String _describeInstance<T>(
    BuildContext context, ImpaktfullUiLoadingErrorData<T> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
