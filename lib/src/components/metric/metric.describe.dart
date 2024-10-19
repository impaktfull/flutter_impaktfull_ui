part of 'metric.dart';

String _describeInstance(BuildContext context, ImpaktfullUiMetric instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
