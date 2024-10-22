import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui_2/src/components/calendar/widget/card/calendar_list_item.dart';
import 'package:impaktfull_ui_2/src/components/calendar/widget/card/calendar_list_section_title.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/extension/datetime_extensions.dart';

class ImpaktfullUiCalendarList extends StatelessWidget {
  final DateTime selectedDate;
  final List<ImpaktfullUiCalendarItem> events;
  final ImpaktfullUiCalendarTheme? theme;

  const ImpaktfullUiCalendarList({
    required this.selectedDate,
    required this.events,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCalendarTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiListView.builder(
        padding: const EdgeInsets.all(16),
        items: events,
        itemBuilder: (context, item, index) {
          final previousItem = index > 0 ? events[index - 1] : null;
          final isSameDay =
              previousItem?.startDate.isSameDay(item.startDate) ?? false;
          final subtitle = item.startDate.format('dd/MM/yyyy');
          final previousSubtitle = previousItem?.startDate.format('dd/MM/yyyy');
          return ImpaktfullUiAutoLayout.vertical(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isSameDay) ...[
                if (previousSubtitle != subtitle) ...[
                  const SizedBox(height: 8),
                ],
                ImpaktfullUiCalendarSectionTitle(
                  subtitle: subtitle,
                  title: item.startDate.format('HH:mm'),
                  theme: componentTheme,
                ),
              ],
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: componentTheme.dimens.sectionTitleWidth),
                child: ImpaktfullUiCalendarListItem(
                  item: item,
                  theme: componentTheme,
                ),
              ),
            ],
          );
        },
        noDataLabel: 'No events found',
      ),
    );
  }
}
