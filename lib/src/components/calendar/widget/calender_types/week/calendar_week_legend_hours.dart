import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component.dart';

class ImpaktfullUiCalendarWeekLegendHours extends StatelessWidget {
  final ImpaktfullUiCalendarTheme? theme;
  const ImpaktfullUiCalendarWeekLegendHours({
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => SizedBox(
        height: componentTheme.dimens.weekHourHeight * 24,
        child: ImpaktfullUiAutoLayout.horizontal(
          children: [
            SizedBox(
              width: componentTheme.dimens.sectionTitleWidth,
              child: ImpaktfullUiAutoLayout.vertical(
                children: [
                  for (var i = 0; i < 24; ++i) ...[
                    SizedBox(height: componentTheme.dimens.weekHourHeight),
                    if (i < 23) ...[
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            width: componentTheme.dimens.sectionTitleWidth,
                          ),
                          Positioned(
                            top: -10,
                            child: Text(
                              '${(i + 1).toString().padLeft(2, '0')}:00',
                              style: componentTheme.textStyles.sectionTitle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ],
              ),
            ),
            Expanded(
              child: ImpaktfullUiAutoLayout.vertical(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < 24; ++i) ...[
                    const Spacer(),
                    if (i < 23) const ImpaktfullUiDivider(),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
