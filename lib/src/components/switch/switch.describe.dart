part of 'switch.dart';

String _describeInstance(BuildContext context, ImpaktfullUiSwitch instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('value', instance.value);
  descriptor.add(
      'accessibleNavigation', MediaQuery.accessibleNavigationOf(context));
  return descriptor.describe();
}
