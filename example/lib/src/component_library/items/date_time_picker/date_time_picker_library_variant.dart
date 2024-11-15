import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/date_time_picker/date_time_picker_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class DateTimePickerLibraryVariant
    extends ComponentLibraryVariant<DateTimePickerLibraryPrimaryInputs> {
  const DateTimePickerLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, DateTimePickerLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        isScrollable: true,
        child: ImpaktfullUiDateTimePicker(
          value: inputs.selectedDate.value,
          onChanged: inputs.selectedDate.updateState,
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
              value: inputs.selectedDate.value,
            );
            ImpaktfullUiNotification.show(title: 'Date time selected: $result');
          },
        ),
      ),
    ];
  }

  @override
  DateTimePickerLibraryPrimaryInputs inputs() =>
      DateTimePickerLibraryPrimaryInputs();
}

class DateTimePickerLibraryPrimaryInputs extends DateTimePickerLibraryInputs {}
