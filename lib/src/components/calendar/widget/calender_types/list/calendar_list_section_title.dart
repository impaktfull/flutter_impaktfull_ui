import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiCalendarListSectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final ImpaktfullUiCalendarTheme? theme;

  const ImpaktfullUiCalendarListSectionTitle({
    required this.title,
    this.subtitle,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.vertical(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (subtitle != null) ...[
            Text(
              subtitle!,
              style: componentTheme.textStyles.sectionSubtitle,
            ),
          ],
          ImpaktfullUiAutoLayout.horizontal(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: componentTheme.dimens.sectionTitleWidth,
                ),
                child: Text(
                  title,
                  style: componentTheme.textStyles.sectionTitle,
                ),
              ),
              Expanded(
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: componentTheme.colors.divider,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
