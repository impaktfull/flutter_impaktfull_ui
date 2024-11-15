import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui_2/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui_2/src/components/date_picker/widgets/date_picker_cell.dart';
import 'package:impaktfull_ui_2/src/components/date_picker/widgets/date_picker_weekdays.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:intl/intl.dart';

class ImpaktfullUiDatePickerYearsPage extends StatelessWidget {
  final ImpaktfullUiDatePickerWeekdaysStartDate weekdaysStartDate;
  final DateTime date;
  final DateTime? selectedStartDate;
  final ValueChanged<DateTime> onChanged;
  final ImpaktfullUiDatePickerTheme theme;

  const ImpaktfullUiDatePickerYearsPage({
    required this.date,
    required this.selectedStartDate,
    required this.onChanged,
    required this.theme,
    this.weekdaysStartDate = ImpaktfullUiDatePickerWeekdaysStartDate.monday,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiDatePickerTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        return SizedBox(
          height: 220,
          child: ImpaktfullUiAutoLayout.vertical(
            children: _getWidgetItems(
              context,
              _getItems(context),
              componentTheme,
            ),
          ),
        );
      },
    );
  }

  List<DateTime> _getItems(BuildContext context) {
    final startYear = (date.year ~/ 10) * 10;
    return [
      for (int year = startYear; year < startYear + 10; year++)
        DateTime(
          year,
          date.month,
          getDayForMonthWithFallback(year, date.month, date.day),
        ),
    ];
  }

  Future<void> onSelected(DateTime item) async => onChanged(item);

  String _formatDate(DateTime item) {
    return DateFormat.y().format(item);
  }

  List<Widget> _getWidgetItems(
    BuildContext context,
    List<DateTime> items,
    ImpaktfullUiDatePickerTheme componentTheme,
  ) {
    final rowItems = <Widget>[];
    const itemsPerRow = 2;
    for (var i = 0; i < items.length; i += itemsPerRow) {
      final rowChildren = <Widget>[];
      for (var j = 0; j < itemsPerRow && i + j < items.length; j++) {
        final item = items[i + j];
        rowChildren.add(
          Expanded(
            child: ImpaktfullUiDatePickerCell(
              value: _formatDate(item),
              fullWidth: true,
              isSelected: selectedStartDate?.isSameMonth(item) ?? false,
              onTap: () => onSelected(item),
              theme: componentTheme,
            ),
          ),
        );
      }
      rowItems.add(
        Expanded(
          child: ImpaktfullUiAutoLayout.horizontal(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: rowChildren,
          ),
        ),
      );
    }

    return rowItems;
  }
}
