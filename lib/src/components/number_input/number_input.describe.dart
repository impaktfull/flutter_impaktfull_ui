part of 'number_input.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiNumberInput instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
