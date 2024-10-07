part of 'fluid_padding.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiFluidPadding instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('breakPoints', instance.breakPoints);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
