import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker_active_type.dart';
import 'package:impaktfull_ui/src/components/date_picker/util/date_picker_bounds.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/page/date_picker_days_page.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/page/date_picker_months_page.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/page/date_picker_years_page.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiDatePickerPage extends StatelessWidget {
  final int? firstDayOfWeek;
  final ImpaktfullUiDatePickerLocalizations? localizations;
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

  /// The dates the user can pick.
  final ImpaktfullUiDatePickerBounds bounds;

  const ImpaktfullUiDatePickerPage({
    required this.margin,
    required this.date,
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.activeType,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    required this.theme,
    this.bounds = ImpaktfullUiDatePickerBounds.unbounded,
    this.firstDayOfWeek,
    this.localizations,
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
                  firstDayOfWeek: firstDayOfWeek,
                  localizations: localizations,
                  bounds: bounds,
                );
              case ImpaktfullUiDatePickerActiveType.months:
                return ImpaktfullUiDatePickerMonthsPage(
                  date: date,
                  selectedStartDate: selectedStartDate,
                  theme: componentTheme,
                  onChanged: _onMonthChanged,
                  bounds: bounds,
                );
              case ImpaktfullUiDatePickerActiveType.years:
                return ImpaktfullUiDatePickerYearsPage(
                  date: date,
                  selectedStartDate: selectedStartDate,
                  theme: componentTheme,
                  onChanged: _onYearChanged,
                  bounds: bounds,
                );
            }
          },
        ),
      ),
    );
  }

  void _onSelected(DateTime value) {
    // A day outside the bounds is not tappable, but a range can never report
    // a start or an end outside them either.
    if (!bounds.isDayEnabled(value)) return;
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
