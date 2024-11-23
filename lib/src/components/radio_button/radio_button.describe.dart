part of 'radio_button.dart';

String _describeInstance<T>(
    BuildContext context, ImpaktfullUiRadioButton<T> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
