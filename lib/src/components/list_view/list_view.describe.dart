part of 'list_view.dart';

String _describeInstance<T>(
    BuildContext context, ImpaktfullUiListView<T> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('child', instance.child);
  descriptor.add('children', instance.children);
  descriptor.add('items', instance.items);
  descriptor.add('itemBuilder', instance.itemBuilder);
  descriptor.add('padding', instance.padding);
  descriptor.add('spacing', instance.spacing);
  descriptor.add('separated', instance.separated);
  descriptor.add('noDataLabel', instance.noDataLabel);
  descriptor.add('refreshBtnLabel', instance.refreshBtnLabel);
  descriptor.add('isLoading', instance.isLoading);
  descriptor.add('onRefresh', instance.onRefresh);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
