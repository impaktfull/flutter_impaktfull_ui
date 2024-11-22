part of 'confetti.dart';

String _describeInstance(BuildContext context, ImpaktfullUiConfetti instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
