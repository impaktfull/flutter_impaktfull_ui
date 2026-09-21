import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/components/calendar/model/calendar_list_item.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/list/calendar_list_event_item.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/list/calendar_list_section_title.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_locale_scope.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiCalendarListItem extends StatelessWidget {
  final ImpaktfullUiCalendarListItemModel item;
  final ImpaktfullUiCalendarListItemModel? previousItem;
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
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final subtitle = _createSectionSubTitle(context, item)!;
        final previousSubtitle = _createSectionSubTitle(context, previousItem);
        final title = _createSectionTitle(context, item)!;
        final previousTitle = _createSectionTitle(context, previousItem);
        final showSectionTitle =
            title != previousTitle || subtitle != previousSubtitle;
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
              padding: EdgeInsetsDirectional.only(
                  start: componentTheme.dimens.sectionTitleWidth),
              child: ImpaktfullUiCalendarListEventItem(
                item: item.event,
                showForDate: item.date,
                onTap: onTap,
                theme: componentTheme,
              ),
            ),
          ],
        );
      },
    );
  }

  String? _createSectionTitle(
      BuildContext context, ImpaktfullUiCalendarListItemModel? event) {
    if (event == null) return null;
    final minutes = event.date.minute;
    final roundedMinutes = minutes < 30 ? 0 : 30;
    return ImpaktfullUiLocaleUtil.formatTime(
      context,
      event.date.copyWith(minute: roundedMinutes),
      use24HourFormat:
          ImpaktfullUiCalendarLocaleScope.use24HourFormatOf(context),
    );
  }

  String? _createSectionSubTitle(
      BuildContext context, ImpaktfullUiCalendarListItemModel? event) {
    if (event == null) return null;
    return ImpaktfullUiLocaleUtil.formatShortDate(context, event.date);
  }
}
