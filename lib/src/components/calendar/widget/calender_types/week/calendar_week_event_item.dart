import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui_2/src/components/calendar/widget/time/calendar_event_time.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiCalendarWeekEventItem extends StatelessWidget {
  final ImpaktfullUiCalendarEvent event;
  final double height;
  final VoidCallback onTap;
  final ImpaktfullUiCalendarTheme? theme;
  const ImpaktfullUiCalendarWeekEventItem({
    required this.event,
    required this.height,
    required this.onTap,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCalendarTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final isSmall = height < componentTheme.dimens.weekEventMinHeightSmall;
        final isExtraSmall =
            height < componentTheme.dimens.weekEventMinHeightExtraSmall;
        return ImpaktfullUiCard(
          height: max(height, 17),
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: isExtraSmall ? 0 : 4,
          ),
          onTap: onTap,
          child: LayoutBuilder(builder: (context, constraints) {
            final showTime = constraints.maxWidth > 110;
            return ImpaktfullUiAutoLayout.vertical(
              spacing: 4,
              children: [
                if (isSmall) ...[
                  ImpaktfullUiAutoLayout.horizontal(
                    spacing: 8,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          event.title,
                          style: componentTheme.textStyles.listItemTitleSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (showTime) ...[
                        ImpaktfullUiCalendarEventTime(
                          item: event,
                          style:
                              componentTheme.textStyles.listItemSubtitleSmall,
                        ),
                      ],
                    ],
                  ),
                ] else ...[
                  Text(
                    event.title,
                    style: componentTheme.textStyles.listItemTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ImpaktfullUiCalendarEventTime(
                    item: event,
                    style: componentTheme.textStyles.listItemSubtitle,
                  ),
                ],
              ],
            );
          }),
        );
      },
    );
  }
}
