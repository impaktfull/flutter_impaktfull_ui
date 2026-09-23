import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui/src/components/date_picker/util/date_picker_bounds.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/date_picker_cell.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';

class ImpaktfullUiDatePickerYearsPage extends StatelessWidget {
  final DateTime date;
  final DateTime? selectedStartDate;
  final ValueChanged<DateTime> onChanged;
  final ImpaktfullUiDatePickerTheme theme;

  /// The dates the user can pick.
  final ImpaktfullUiDatePickerBounds bounds;

  const ImpaktfullUiDatePickerYearsPage({
    required this.date,
    required this.selectedStartDate,
    required this.onChanged,
    required this.theme,
    this.bounds = ImpaktfullUiDatePickerBounds.unbounded,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder(
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

  /// The 10 years of the decade, `null` for a year outside the bounds: the
  /// list only shows years the user can pick, on the same grid as a decade
  /// that is completely inside the bounds.
  List<DateTime?> _getItems(BuildContext context) {
    final startYear = (date.year ~/ 10) * 10;
    return [
      for (int year = startYear; year < startYear + 10; year++)
        if (!bounds.isYearEnabled(year))
          null
        else
          DateTime(
            year,
            date.month,
            dayForMonthWithFallback(year, date.month, date.day),
          ),
    ];
  }

  Future<void> onSelected(DateTime item) async => onChanged(item);

  String _formatDate(BuildContext context, DateTime item) {
    return ImpaktfullUiLocaleUtil.formatYear(context, item);
  }

  List<Widget> _getWidgetItems(
    BuildContext context,
    List<DateTime?> items,
    ImpaktfullUiDatePickerTheme componentTheme,
  ) {
    final rowItems = <Widget>[];
    const itemsPerRow = 2;
    for (var i = 0; i < items.length; i += itemsPerRow) {
      final rowChildren = <Widget>[];
      for (var j = 0; j < itemsPerRow && i + j < items.length; j++) {
        final item = items[i + j];
        if (item == null) {
          rowChildren.add(const Expanded(child: SizedBox()));
          continue;
        }
        rowChildren.add(
          Expanded(
            child: ImpaktfullUiDatePickerCell(
              value: _formatDate(context, item),
              fullWidth: true,
              isSelected: selectedStartDate?.isSameYear(item) ?? false,
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
