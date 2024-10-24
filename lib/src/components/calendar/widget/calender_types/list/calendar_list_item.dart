import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui_2/src/components/calendar/widget/calender_types/list/calendar_list_event_item.dart';
import 'package:impaktfull_ui_2/src/components/calendar/widget/calender_types/list/calendar_list_section_title.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/extension/datetime_extensions.dart';

class ImpaktfullUiCalendarListItem extends StatelessWidget {
  final ImpaktfullUiCalendarEvent item;
  final ImpaktfullUiCalendarEvent? previousItem;
  final VoidCallback onTap;
  final ImpaktfullUiCalendarTheme? theme;
  const ImpaktfullUiCalendarListItem({
    required this.item,
    required this.onTap,
    this.previousItem,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCalendarTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final subtitle = _createSectionSubTitle(item)!;
        final previousSubtitle = _createSectionSubTitle(previousItem);
        final title = _createSectionTitle(item)!;
        final previousTitle = _createSectionTitle(previousItem);
        final showSectionTitle = title != previousTitle || subtitle != previousSubtitle;
        return ImpaktfullUiAutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showSectionTitle) ...[
              if (previousSubtitle != subtitle) ...[
                const SizedBox(height: 8),
              ],
              ImpaktfullUiCalendarListSectionTitle(
                subtitle: previousSubtitle == subtitle ? null : subtitle,
                title: title,
                theme: componentTheme,
              ),
            ],
            if (!showSectionTitle) ...[
              const SizedBox(height: 8),
            ],
            Padding(
              padding: EdgeInsetsDirectional.only(start: componentTheme.dimens.sectionTitleWidth),
              child: ImpaktfullUiCalendarListEventItem(
                item: item,
                onTap: onTap,
                theme: componentTheme,
              ),
            ),
          ],
        );
      },
    );
  }

  String? _createSectionTitle(ImpaktfullUiCalendarEvent? event) {
    if (event == null) return null;
    final minutes = event.startDate.minute;
    final roundedMinutes = minutes < 30 ? 0 : 30;
    return event.startDate.copyWith(minute: roundedMinutes).format('HH:mm');
  }

  String? _createSectionSubTitle(ImpaktfullUiCalendarEvent? event) {
    if (event == null) return null;
    return event.startDate.format('dd/MM/yyyy');
  }
}
