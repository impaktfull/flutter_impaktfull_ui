import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/time/calendar_event_time.dart';
import 'package:impaktfull_ui/src/components/card/card.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiCalendarListEventItem extends StatelessWidget {
  final ImpaktfullUiCalendarEvent item;
  final DateTime? showForDate;
  final ImpaktfullUiCalendarTheme? theme;
  final VoidCallback onTap;
  const ImpaktfullUiCalendarListEventItem({
    required this.item,
    required this.onTap,
    this.showForDate,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCalendarTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiCard(
        width: double.infinity,
        onTap: onTap,
        child: ImpaktfullUiAutoLayout.vertical(
          spacing: 12,
          children: [
            Text(
              item.title,
              style: componentTheme.textStyles.listItemTitle,
            ),
            ImpaktfullUiCalendarEventTime(
              item: item,
              forDate: showForDate,
              style: componentTheme.textStyles.listItemSubtitle,
            ),
          ],
        ),
      ),
    );
  }
}
