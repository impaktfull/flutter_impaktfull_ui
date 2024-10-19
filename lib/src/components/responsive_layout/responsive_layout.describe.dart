part of 'responsive_layout.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiResponsiveLayout instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
