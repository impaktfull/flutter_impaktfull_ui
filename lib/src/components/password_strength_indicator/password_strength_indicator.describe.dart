part of 'password_strength_indicator.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiPasswordStrengthIndicator instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
