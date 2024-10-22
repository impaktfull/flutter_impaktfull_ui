part of 'calendar.dart';

String _describeInstance(BuildContext context, ImpaktfullUiCalendar instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
