import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/date_picker/date_picker_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class DatePickerLibraryVariant extends ComponentLibraryVariant<DatePickerLibraryPrimaryInputs> {
  const DatePickerLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, DatePickerLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiDatePicker(
        selectedDate: inputs.selectedStartDate.value,
        onDateChanged: (value) {
          inputs.selectedStartDate.updateState(value);
          inputs.selectedEndDate.updateState(null);
        },
      ),
      ComponentsLibraryVariantDescriptor(
        wrapWithCard: true,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ImpaktfullUiDatePicker(
          selectedDate: inputs.selectedStartDate.value,
          onDateChanged: (value) {
            inputs.selectedStartDate.updateState(value);
            inputs.selectedEndDate.updateState(null);
          },
          margin: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        wrapWithCard: true,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ImpaktfullUiDatePicker.range(
          selectedStartDate: inputs.selectedStartDate.value,
          selectedEndDate: inputs.selectedEndDate.value,
          onStartDateChanged: inputs.selectedStartDate.updateState,
          onEndDateChanged: inputs.selectedEndDate.updateState,
          margin: const EdgeInsets.symmetric(horizontal: 16),
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
            );
            ImpaktfullUiNotification.show(title: 'Date range selected: ${result?.start} - ${result?.end}');
          },
        ),
      ),
    ];
  }

  @override
  DatePickerLibraryPrimaryInputs inputs() => DatePickerLibraryPrimaryInputs();
}

class DatePickerLibraryPrimaryInputs extends DatePickerLibraryInputs {}
