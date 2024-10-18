part of 'placeholder_state.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiPlaceholderState instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
