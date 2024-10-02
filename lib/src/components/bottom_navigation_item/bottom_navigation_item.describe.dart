part of 'bottom_navigation_item.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiBottomNavigationItem instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('badgeShow', instance.badgeShow);
  descriptor.add('badgeColor', instance.badgeColor);
  descriptor.add('badgeText', instance.badgeText);
  descriptor.add('label', instance.label);
  descriptor.add('asset', instance.asset);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
