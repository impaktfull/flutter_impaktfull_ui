import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui_2/src/components/calendar/widget/card/calendar_list_item.dart';
import 'package:impaktfull_ui_2/src/components/calendar/widget/card/calendar_list_section_title.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui_2/src/util/extension/list_extension.dart';

class ImpaktfullUiCalendarList extends StatefulWidget {
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
  State<ImpaktfullUiCalendarList> createState() =>
      _ImpaktfullUiCalendarListState();
}

class _ImpaktfullUiCalendarListState extends State<ImpaktfullUiCalendarList> {
  late List<ImpaktfullUiCalendarItem> _events;

  @override
  void initState() {
    super.initState();
    _setEvents(widget.events);
  }

  @override
  void didUpdateWidget(ImpaktfullUiCalendarList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.events != oldWidget.events) {
      _setEvents(widget.events);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCalendarTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiListView.builder(
        padding: const EdgeInsets.all(16),
        items: _events,
        itemBuilder: (context, item, index) {
          final previousItem = index > 0 ? _events[index - 1] : null;
          final subtitle = _createSectionSubTitle(item)!;
          final previousSubtitle = _createSectionSubTitle(previousItem);
          final title = _createSectionTitle(item)!;
          final previousTitle = _createSectionTitle(previousItem);
          final showSectionTitle =
              previousSubtitle != subtitle || previousTitle != title;
          return ImpaktfullUiAutoLayout.vertical(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showSectionTitle) ...[
                if (previousSubtitle != subtitle) ...[
                  const SizedBox(height: 8),
                ],
                ImpaktfullUiCalendarSectionTitle(
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

  void _setEvents(List<ImpaktfullUiCalendarItem> events) {
    final now = DateTime.now();
    final futureEvents = widget.events.where((e) {
      final compareDate = e.endDate ?? e.startDate;
      return compareDate.isAfter(now);
    }).toList();
    futureEvents.sortBy((e) => e.startDate);
    setState(() {
      _events = futureEvents;
    });
  }

  String? _createSectionTitle(ImpaktfullUiCalendarItem? item) {
    if (item == null) return null;
    final minutes = item.startDate.minute;
    final roundedMinutes = minutes < 30 ? 0 : 30;
    return item.startDate.copyWith(minute: roundedMinutes).format('HH:mm');
  }

  String? _createSectionSubTitle(ImpaktfullUiCalendarItem? item) {
    if (item == null) return null;
    return item.startDate.format('dd/MM/yyyy');
  }
}
