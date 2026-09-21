import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/date_picker_cell.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/date_picker_weekdays.dart';
import 'package:impaktfull_ui/src/components/grid_view/grid_view.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiDatePickerDaysPage extends StatelessWidget {
  /// [DateTime.monday] ... [DateTime.sunday], defaults to the locale.
  final int? firstDayOfWeek;
  final ImpaktfullUiDatePickerLocalizations? localizations;
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
    this.firstDayOfWeek,
    this.localizations,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImpaktfullUiDatePickerWeekdays(
            firstDayOfWeek: _getFirstDayOfWeek(context),
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
                placeholderData: ImpaktfullUiGridViewPlaceholderData(
                  title: _getLocalizations(context).noDays,
                ),
                itemBuilder: (context, item, index) =>
                    ImpaktfullUiDatePickerCell(
                  value: ImpaktfullUiLocaleUtil.formatDay(context, item),
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

  int _getFirstDayOfWeek(BuildContext context) =>
      ImpaktfullUiLocaleUtil.firstDayOfWeek(context, override: firstDayOfWeek);

  ImpaktfullUiDatePickerLocalizations _getLocalizations(BuildContext context) =>
      localizations ??
      ImpaktfullUiLocalizations.of<ImpaktfullUiDatePickerLocalizations>(
          context);

  List<DateTime> _getItems(BuildContext context) {
    final dates = <DateTime>[];
    final daysPageDateMonth = date.getDaysInMonth();
    final days = List.generate(
        daysPageDateMonth, (index) => date.copyWith(day: index + 1));
    final amountOfDaysBeforeMonth = ImpaktfullUiLocaleUtil.daysSinceStartOfWeek(
        days.first, _getFirstDayOfWeek(context));

    // Add days from previous month
    if (amountOfDaysBeforeMonth != 0) {
      final previousMonth = date.getPreviousMonth();
      final daysPreviousMonth = previousMonth.getDaysInMonth();
      final daysBeforeMonth = List.generate(amountOfDaysBeforeMonth,
              (index) => previousMonth.copyWith(day: daysPreviousMonth - index))
          .reversed;
      dates.addAll(daysBeforeMonth);
    }

    // Add current month days
    dates.addAll(days);

    // Add days from next month to complete 7 rows (42 days total)
    final remainingDays = 42 - dates.length;
    final nextMonth = date.getNextMonth();
    final daysAfterMonth = List.generate(
        remainingDays, (index) => nextMonth.copyWith(day: index + 1));
    dates.addAll(daysAfterMonth);

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
    // Check the end day before the days in between: the end date can have a
    // time, which makes the end day itself "before" the end date.
    if (item.isSameDay(endDate)) return ImpaktfullUiDatePickerCellType.end;
    if (item.isAfter(startDate) && item.isBefore(endDate)) {
      return ImpaktfullUiDatePickerCellType.between;
    }
    if (item.isSameDay(DateTime.now())) {
      return ImpaktfullUiDatePickerCellType.today;
    }
    return ImpaktfullUiDatePickerCellType.single;
  }
}
