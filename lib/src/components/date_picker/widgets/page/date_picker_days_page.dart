import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui_2/src/components/date_picker/widgets/date_picker_cell.dart';
import 'package:impaktfull_ui_2/src/components/date_picker/widgets/date_picker_weekdays.dart';
import 'package:impaktfull_ui_2/src/components/grid_view/grid_view.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/extension/datetime_extensions.dart';

class ImpaktfullUiDatePickerDaysPage extends StatelessWidget {
  final ImpaktfullUiDatePickerWeekdaysStartDate weekdaysStartDate;
  final DateTime date;
  final DateTime? selectedStartDate;
  final DateTime? selectedEndDate;
  final ValueChanged<DateTime> onSelected;
  final ImpaktfullUiDatePickerTheme theme;

  const ImpaktfullUiDatePickerDaysPage({
    required this.date,
    required this.selectedStartDate,
    required this.onSelected,
    required this.theme,
    this.selectedEndDate,
    this.weekdaysStartDate = ImpaktfullUiDatePickerWeekdaysStartDate.monday,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiDatePickerTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImpaktfullUiDatePickerWeekdays(
            startDate: weekdaysStartDate,
            theme: componentTheme,
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: SizedBox(
              height: 280,
              child: ImpaktfullUiGridView.builder(
                scrollPhysics: const NeverScrollableScrollPhysics(),
                items: _getItems(context),
                itemBuilder: (context, item, index) =>
                    ImpaktfullUiDatePickerCell(
                  value: item.day.toString(),
                  active: item.isSameMonth(date),
                  isSelected: _isSelected(item),
                  type: _getCellType(item),
                  onTap: () => onSelected(item),
                  theme: componentTheme,
                ),
                crossAxisCount: (context, config) => 7,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DateTime> _getItems(BuildContext context) {
    final dates = <DateTime>[];
    final daysPageDateMonth = date.getDaysInMonth();
    final days = List.generate(
        daysPageDateMonth, (index) => date.copyWith(day: index + 1));
    final firstWeekday = days.first.weekday;
    if (firstWeekday != 0) {
      final previousMonth = date.getPreviousMonth();
      final daysPreviousMonth = previousMonth.getDaysInMonth();
      final daysBeforeMonth = List.generate(firstWeekday - 1,
              (index) => previousMonth.copyWith(day: daysPreviousMonth - index))
          .reversed;
      dates.addAll(daysBeforeMonth);
    }
    dates.addAll(days);
    final lastWeekday = days.last.weekday;
    if (lastWeekday != 7) {
      final nextMonth = date.getNextMonth();
      final daysAfterMonth = List.generate(
          7 - lastWeekday, (index) => nextMonth.copyWith(day: index + 1));
      dates.addAll(daysAfterMonth);
    }
    return dates;
  }

  bool _isSelected(DateTime item) {
    if (selectedStartDate != null && item.isSameDay(selectedStartDate!)) {
      return true;
    }
    if (selectedEndDate != null && item.isSameDay(selectedEndDate!)) {
      return true;
    }
    return false;
  }

  ImpaktfullUiDatePickerCellType _getCellType(DateTime item) {
    final startDate = selectedStartDate;
    final endDate = selectedEndDate;
    if (startDate == null) {
      if (item.isSameDay(DateTime.now())) {
        return ImpaktfullUiDatePickerCellType.today;
      }
      return ImpaktfullUiDatePickerCellType.single;
    }
    if (endDate == null) {
      if (item.isSameDay(DateTime.now())) {
        return ImpaktfullUiDatePickerCellType.today;
      }
      return ImpaktfullUiDatePickerCellType.single;
    }
    if (item.isSameDay(startDate)) return ImpaktfullUiDatePickerCellType.start;
    if (item.isAfter(startDate) && item.isBefore(endDate)) {
      return ImpaktfullUiDatePickerCellType.between;
    }
    if (item.isSameDay(endDate)) return ImpaktfullUiDatePickerCellType.end;
    if (item.isSameDay(DateTime.now())) {
      return ImpaktfullUiDatePickerCellType.today;
    }
    return ImpaktfullUiDatePickerCellType.single;
  }
}
