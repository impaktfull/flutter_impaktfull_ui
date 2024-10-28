part of 'slider.dart';

String _describeInstance(BuildContext context, ImpaktfullUiSlider instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}