part of 'input_field.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiInputField instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('label', instance.label);
  descriptor.add('hint', instance.hint);
  descriptor.add('leadingIcon', instance.leadingIcon);
  descriptor.add('leadingIcon', instance.leadingIcon);
  descriptor.add('value', instance.value);
  descriptor.add('controller', instance.controller);
  descriptor.add('obscureText', instance.obscureText);
  descriptor.add('textInputType', instance.textInputType);
  descriptor.add('textInputAction', instance.textInputAction);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
