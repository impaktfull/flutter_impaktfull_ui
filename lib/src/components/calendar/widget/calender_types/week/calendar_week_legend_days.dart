import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component.dart';

class ImpaktfullUiCalendarWeekLegendDays extends StatelessWidget {
  final DateTime firstDay;
  final int amountOfDays;
  final ImpaktfullUiCalendarTheme? theme;

  const ImpaktfullUiCalendarWeekLegendDays({
    required this.firstDay,
    required this.amountOfDays,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
        child: ImpaktfullUiAutoLayout.horizontal(
          spacing: 2,
          children: [
            for (var i = 0; i < amountOfDays; ++i) ...[
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: firstDay.add(Duration(days: i)).format('dd'),
                        style: componentTheme.textStyles.dayTitle,
                      ),
                      TextSpan(
                        text: firstDay.add(Duration(days: i)).format(' EEE'),
                        style: componentTheme.textStyles.dayOfTheWeekTitle,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
