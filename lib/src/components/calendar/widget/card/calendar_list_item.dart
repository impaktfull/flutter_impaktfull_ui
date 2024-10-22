import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui_2/src/components/card/card.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/extension/datetime_extensions.dart';

class ImpaktfullUiCalendarListItem extends StatelessWidget {
  final ImpaktfullUiCalendarItem item;
  final ImpaktfullUiCalendarTheme? theme;
  const ImpaktfullUiCalendarListItem({
    required this.item,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCalendarTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiCard(
        width: double.infinity,
        child: ImpaktfullUiAutoLayout.vertical(
          spacing: 12,
          children: [
            Text(
              item.title,
              style: componentTheme.textStyles.listItemTitle,
            ),
            Text.rich(
              style: componentTheme.textStyles.listItemSubtitle,
              TextSpan(
                children: [
                  if (item.isAllDay) ...[
                    const TextSpan(text: 'All day'),
                  ] else ...[
                    TextSpan(text: item.startDate.format('HH:mm')),
                    if (item.endDate != null) ...[
                      const TextSpan(text: ' - '),
                      TextSpan(text: item.endDate!.format('HH:mm')),
                    ],
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
