part of 'color_picker.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiColorPicker instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('selectedColor', instance.selectedColor);
  descriptor.add('allowedColors', instance.allowedColors);
  descriptor.add('type', instance.type);
  descriptor.add('showActiveColor', instance.showActiveColor);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
