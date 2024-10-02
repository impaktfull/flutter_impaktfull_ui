part of 'horizontal_tab.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiHorizontalTab instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('label', instance.label);
  descriptor.add('badge', instance.badge);
  descriptor.add('badgeType', instance.badgeType);
  descriptor.add('isSelected', instance.isSelected);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
