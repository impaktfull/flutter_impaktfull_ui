part of 'carrousel.dart';

String _describeInstance(BuildContext context, ImpaktfullUiCarrousel instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
