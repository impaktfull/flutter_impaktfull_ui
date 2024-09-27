import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/badge/badge.dart';
import 'package:impaktfull_ui_2/src/components/table_row_item/table_row_item.dart';
import 'package:impaktfull_ui_2/src/components/table_row_item/table_row_item_type.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

export 'table_row_item_style.dart';

class ImpaktfullUiTableRowItem extends StatelessWidget {
  final ImpaktfullUiTableRowItemType type;
  final String? title;
  final VoidCallback? onTap;
  final ImpaktfullUiBadgeType? badgeType;
  final String? subtitle;
  final Widget Function(BuildContext, ImpaktfullUiTableRowItemTheme)? builder;
  final ImpaktfullUiTableRowItemTheme? theme;
  final EdgeInsets padding;

  const ImpaktfullUiTableRowItem.text({
    required String this.title,
    this.subtitle,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    this.theme,
    super.key,
  })  : type = ImpaktfullUiTableRowItemType.text,
        builder = null,
        badgeType = null;

  const ImpaktfullUiTableRowItem.badge({
    required String this.title,
    this.badgeType,
    this.subtitle,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    this.theme,
    super.key,
  })  : type = ImpaktfullUiTableRowItemType.badge,
        builder = null,
        onTap = null;

  const ImpaktfullUiTableRowItem.custom({
    required this.builder,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    this.theme,
    super.key,
  })  : type = ImpaktfullUiTableRowItemType.custom,
        title = null,
        subtitle = null,
        badgeType = null,
        onTap = null;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiTableRowItemTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) {
        if (builder != null) return builder!(context, componentTheme);
        if (type == ImpaktfullUiTableRowItemType.badge) {
          return Padding(
            padding: padding,
            child: Align(
              alignment: Alignment.centerLeft,
              child: ImpaktfullUiBadge(
                type: badgeType ?? ImpaktfullUiBadgeType.primary,
                label: title!,
              ),
            ),
          );
        }
        return ImpaktfullUiTouchFeedback(
          onTap: onTap,
          child: Container(
            constraints: const BoxConstraints(minHeight: 48),
            padding: padding,
            alignment: AlignmentDirectional.centerStart,
            child: ImpaktfullUiAutoLayout.vertical(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(
                    title!,
                    style: componentTheme.textStyles.title,
                  ),
                ],
                if (subtitle != null) ...[
                  Text(
                    subtitle!,
                    style: componentTheme.textStyles.subtitle,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
