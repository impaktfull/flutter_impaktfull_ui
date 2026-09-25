import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/date_picker/date_picker.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';

class ImpaktfullUiDatePickerWeekdays extends StatelessWidget {
  /// [DateTime.monday] ... [DateTime.sunday]
  final int firstDayOfWeek;
  final ImpaktfullUiDatePickerTheme theme;
  const ImpaktfullUiDatePickerWeekdays({
    required this.theme,
    this.firstDayOfWeek = DateTime.monday,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        // 1 January 2023 is a Sunday
        final firstDay = DateTime(2023, 1, 1 + firstDayOfWeek % 7);
        final days = [
          for (var i = 0; i < DateTime.daysPerWeek; ++i)
            ImpaktfullUiLocaleUtil.formatWeekdayShort(
              context,
              DateTime(firstDay.year, firstDay.month, firstDay.day + i),
            ),
        ];
        return ImpaktfullUiAutoLayout.horizontal(
          spacing: componentTheme.dimens.spacing,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final day in days) ...[
              Expanded(
                // One line: a wrapped weekday makes the row taller and pushes
                // the last week of the month out of the fixed height of the
                // picker. A weekday that is too wide is scaled down.
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    day,
                    style: componentTheme.textStyles.weekday,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
