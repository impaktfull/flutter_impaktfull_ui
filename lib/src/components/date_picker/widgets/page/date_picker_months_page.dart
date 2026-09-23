import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui/src/components/date_picker/util/date_picker_bounds.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/date_picker_cell.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';

class ImpaktfullUiDatePickerMonthsPage extends StatelessWidget {
  final DateTime date;
  final DateTime? selectedStartDate;
  final ValueChanged<DateTime> onChanged;
  final ImpaktfullUiDatePickerTheme theme;

  /// The dates the user can pick.
  final ImpaktfullUiDatePickerBounds bounds;

  const ImpaktfullUiDatePickerMonthsPage({
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
      builder: (context, componentTheme) => SizedBox(
        height: 264,
        child: ImpaktfullUiAutoLayout.vertical(
          children:
              _getWidgetItems(context, _getItems(context), componentTheme),
        ),
      ),
    );
  }

  List<DateTime> _getItems(BuildContext context) {
    return [
      for (final month in List.generate(12, (index) => index + 1)) ...[
        DateTime(
          date.year,
          month,
          dayForMonthWithFallback(date.year, month, date.day),
        ),
      ],
    ];
  }

  Future<void> onSelected(DateTime item) async => onChanged(item);

  String _formatDate(BuildContext context, DateTime item) {
    return ImpaktfullUiLocaleUtil.formatMonth(context, item);
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
        final isDisabled = !bounds.isMonthEnabled(item);
        rowChildren.add(
          Expanded(
            child: ImpaktfullUiDatePickerCell(
              value: _formatDate(context, item),
              fullWidth: true,
              isDisabled: isDisabled,
              isSelected: !isDisabled &&
                  (selectedStartDate?.isSameMonth(item) ?? false),
              onTap: isDisabled ? null : () => onSelected(item),
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
