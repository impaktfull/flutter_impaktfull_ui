part of 'refresh_indicator.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiRefreshIndicator instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('child', instance.child);
  descriptor.add('onRefresh', instance.onRefresh);
  return descriptor.describe();
}
