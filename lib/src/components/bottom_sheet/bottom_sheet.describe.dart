part of 'bottom_sheet.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiBottomSheet instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('child', instance.child);
  descriptor.add('actions', instance.actions);
  descriptor.add('title', instance.title);
  descriptor.add('subtitle', instance.subtitle);
  descriptor.add('showHandle', instance.showHandle);
  descriptor.add('actions', instance.hasClose);
  descriptor.add('onCloseTapped', instance.onCloseTapped);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
