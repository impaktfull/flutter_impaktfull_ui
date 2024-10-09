part of 'date_picker.dart';

String _describeInstance(
    BuildContext context, ImpaktfullUiDatePicker instance) {
  final descriptor = ComponentDescriptor();
  descriptor.add('onStartDateChanged', instance.onStartDateChanged);
  descriptor.add('onEndDateChanged', instance.onEndDateChanged);
  descriptor.add('selectedStartDate', instance.selectedStartDate);
  descriptor.add('selectedEndDate', instance.selectedEndDate);
  descriptor.add('type', instance.type);
  descriptor.add('margin', instance.margin);
  descriptor.add('theme', instance.theme);
  return descriptor.describe();
}
