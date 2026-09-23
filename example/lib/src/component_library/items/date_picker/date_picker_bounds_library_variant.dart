import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_datetime_input.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

/// Shows `firstDate` & `lastDate` on every date picker: the days outside them
/// are disabled and the picker can not navigate past them.
class DatePickerBoundsLibraryVariant
    extends ComponentLibraryVariant<DatePickerBoundsLibraryInputs> {
  const DatePickerBoundsLibraryVariant();

  @override
  String get title => 'First & last date';

  @override
  List<Widget> build(
      BuildContext context, DatePickerBoundsLibraryInputs inputs) {
    final firstDate = inputs.firstDate.value;
    final lastDate = inputs.lastDate.value;
    return [
      ComponentsLibraryVariantDescriptor(
        title: 'DatePicker',
        wrapWithCard: true,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ImpaktfullUiDatePicker(
          selectedDate: inputs.selectedStartDate.value,
          firstDate: firstDate,
          lastDate: lastDate,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          onDateChanged: (value) {
            inputs.selectedStartDate.updateState(value);
            inputs.selectedEndDate.updateState(null);
          },
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        title: 'DatePicker.range',
        wrapWithCard: true,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ImpaktfullUiDatePicker.range(
          selectedStartDate: inputs.selectedStartDate.value,
          selectedEndDate: inputs.selectedEndDate.value,
          firstDate: firstDate,
          lastDate: lastDate,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          onStartDateChanged: inputs.selectedStartDate.updateState,
          onEndDateChanged: inputs.selectedEndDate.updateState,
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        title: 'DateInputField',
        child: ImpaktfullUiDateInputField(
          label: 'Date',
          placeholder: 'Select date',
          value: inputs.selectedStartDate.value,
          firstDate: firstDate,
          lastDate: lastDate,
          onChanged: inputs.selectedStartDate.updateState,
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        title: 'DatePicker.showModal',
        child: ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Show date picker modal',
          onTap: () async {
            final result = await ImpaktfullUiDatePicker.showModal(
              context: context,
              selectedDate: inputs.selectedStartDate.value,
              firstDate: firstDate,
              lastDate: lastDate,
            );
            ImpaktfullUiNotification.show(title: 'Date selected: $result');
          },
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        title: 'DatePicker.showRangeModal',
        child: ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Show range date picker modal',
          onTap: () async {
            final result = await ImpaktfullUiDatePicker.showRangeModal(
              context: context,
              selectedStartDate: inputs.selectedStartDate.value,
              selectedEndDate: inputs.selectedEndDate.value,
              firstDate: firstDate,
              lastDate: lastDate,
            );
            ImpaktfullUiNotification.show(
                title:
                    'Date range selected: ${result?.start} - ${result?.end}');
          },
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        title: 'DateTimePicker.showModal',
        child: ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Show date time picker modal',
          onTap: () async {
            final result = await ImpaktfullUiDateTimePicker.showModal(
              context: context,
              value: inputs.selectedStartDate.value,
              firstDate: firstDate,
              lastDate: lastDate,
            );
            ImpaktfullUiNotification.show(title: 'Date time selected: $result');
          },
        ),
      ),
    ];
  }

  @override
  DatePickerBoundsLibraryInputs inputs() => DatePickerBoundsLibraryInputs();
}

class DatePickerBoundsLibraryInputs extends ComponentLibraryInputs {
  final selectedStartDate = ComponentLibraryDateTimeInput(
    'Selected start date',
    initialValue: DateTime(2023, 7, 6),
  );
  final selectedEndDate = ComponentLibraryDateTimeInput(
    'Selected end date',
  );
  final firstDate = ComponentLibraryDateTimeInput(
    'First date',
    initialValue: DateTime(2023, 6, 15),
    extraInfo: 'The earliest date the user can pick',
  );
  final lastDate = ComponentLibraryDateTimeInput(
    'Last date',
    initialValue: DateTime(2023, 8, 20),
    extraInfo: 'The latest date the user can pick',
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        selectedStartDate,
        selectedEndDate,
        firstDate,
        lastDate,
      ];
}
