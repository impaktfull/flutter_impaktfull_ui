part of 'dropdown.dart';

String _describeInstance<T>(
    BuildContext context, ImpaktfullUiDropdown<T> instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('childWidth', instance.childWidth);
  descriptor.add('height', instance.height);
  descriptor.add('child', instance.child);
  descriptor.add('button', instance.button);
  descriptor.add('items', instance.items);
  descriptor.add('itemBuilder', instance.itemBuilder);
  descriptor.add('noDataLabel', instance.noDataLabel);
  descriptor.add('alignment', instance.alignment);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
