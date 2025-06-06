import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker_active_type.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/date_picker_weekdays.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/page/date_picker_days_page.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/page/date_picker_months_page.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/page/date_picker_years_page.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiDatePickerPage extends StatelessWidget {
  final ImpaktfullUiDatePickerWeekdaysStartDate weekdaysStartDate;
  final DateTime date;
  final ImpaktfullUiDatePickerActiveType activeType;
  final EdgeInsetsGeometry margin;
  final DateTime? selectedStartDate;
  final DateTime? selectedEndDate;
  final ValueChanged<DateTime?> onStartDateChanged;
  final ValueChanged<DateTime?>? onEndDateChanged;
  final Function(ImpaktfullUiDatePickerActiveType, DateTime)?
      onChangeActiveType;
  final ImpaktfullUiDatePickerTheme theme;

  const ImpaktfullUiDatePickerPage({
    required this.margin,
    required this.date,
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.activeType,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    required this.theme,
    this.weekdaysStartDate = ImpaktfullUiDatePickerWeekdaysStartDate.monday,
    this.onChangeActiveType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Padding(
        padding: margin,
        child: Builder(
          builder: (context) {
            switch (activeType) {
              case ImpaktfullUiDatePickerActiveType.days:
                return ImpaktfullUiDatePickerDaysPage(
                  date: date,
                  theme: componentTheme,
                  selectedStartDate: selectedStartDate,
                  selectedEndDate: selectedEndDate,
                  onSelected: _onSelected,
                );
              case ImpaktfullUiDatePickerActiveType.months:
                return ImpaktfullUiDatePickerMonthsPage(
                  date: date,
                  selectedStartDate: selectedStartDate,
                  theme: componentTheme,
                  onChanged: _onMonthChanged,
                );
              case ImpaktfullUiDatePickerActiveType.years:
                return ImpaktfullUiDatePickerYearsPage(
                  date: date,
                  selectedStartDate: selectedStartDate,
                  theme: componentTheme,
                  onChanged: _onYearChanged,
                );
            }
          },
        ),
      ),
    );
  }

  void _onSelected(DateTime value) {
    final startDate = selectedStartDate;
    final onEndDateChanged = this.onEndDateChanged;
    if (onEndDateChanged == null) {
      onStartDateChanged(value);
      return;
    }
    if (startDate == null) {
      onStartDateChanged(value);
    } else if (selectedEndDate == null) {
      if (value.isBefore(startDate) || value.isSameDay(startDate)) {
        onStartDateChanged(value);
      } else {
        onEndDateChanged(value);
      }
    } else {
      onStartDateChanged(value);
      onEndDateChanged(null);
    }
  }

  void _onMonthChanged(DateTime value) =>
      onChangeActiveType?.call(ImpaktfullUiDatePickerActiveType.days, value);

  void _onYearChanged(DateTime value) =>
      onChangeActiveType?.call(ImpaktfullUiDatePickerActiveType.months, value);
}
