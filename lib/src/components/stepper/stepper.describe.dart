part of 'stepper.dart';

String _describeInstance(BuildContext context, ImpaktfullUiStepper instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
