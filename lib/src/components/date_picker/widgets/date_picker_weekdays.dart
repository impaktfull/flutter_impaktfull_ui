import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

enum ImpaktfullUiDatePickerWeekdaysStartDate {
  monday,
  sunday,
}

class ImpaktfullUiDatePickerWeekdays extends StatelessWidget {
  final ImpaktfullUiDatePickerWeekdaysStartDate startDate;
  final ImpaktfullUiDatePickerTheme theme;
  const ImpaktfullUiDatePickerWeekdays({
    required this.theme,
    this.startDate = ImpaktfullUiDatePickerWeekdaysStartDate.monday,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiDatePickerTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final days = [
          'Mon',
          'Tue',
          'Wed',
          'Thu',
          'Fri',
          'Sat',
          'Sun',
        ];
        return ImpaktfullUiAutoLayout.horizontal(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final day in days) ...[
              Expanded(
                child: Text(
                  day,
                  style: componentTheme.textStyles.weekday,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
