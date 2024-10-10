part of 'file_picker.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiFilePicker instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
