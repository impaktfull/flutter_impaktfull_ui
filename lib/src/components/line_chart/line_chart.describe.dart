part of 'line_chart.dart';

String _describeInstance<T, E>(
    BuildContext context, ImpaktfullUiLineChart<T, E> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
