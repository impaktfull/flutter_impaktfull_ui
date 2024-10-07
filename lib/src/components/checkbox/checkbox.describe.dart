part of 'checkbox.dart';

String _describeInstance(BuildContext context, ImpaktfullUiCheckBox instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('value', instance.value ?? 'null');
  descriptor.add('onChanged', instance.onChanged);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
