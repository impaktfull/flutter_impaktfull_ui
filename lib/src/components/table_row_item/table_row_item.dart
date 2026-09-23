import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/badge/badge.dart';
import 'package:impaktfull_ui/src/components/checkbox/checkbox.dart';
import 'package:impaktfull_ui/src/components/table_row_item/table_row_item.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'table_row_item_style.dart';
export 'table_row_item_type.dart';

class ImpaktfullUiTableRowItem extends StatelessWidget {
  final ImpaktfullUiTableRowItemType type;
  final String? title;
  final VoidCallback? onTap;
  final ImpaktfullUiBadgeType? badgeType;
  final String? subtitle;
  final bool? isSelected;
  final ValueChanged<bool>? onChanged;
  final Widget Function(BuildContext, ImpaktfullUiTableRowItemTheme)? builder;
  final ImpaktfullUiTableRowItemTheme? theme;
  final EdgeInsets padding;
  final EdgeInsets? _customPadding;

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
        _customPadding = null,
        builder = null,
        badgeType = null,
        onChanged = null,
        isSelected = false;

  const ImpaktfullUiTableRowItem.checkbox({
    required bool this.isSelected,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    this.theme,
    super.key,
  })  : type = ImpaktfullUiTableRowItemType.checkbox,
        _customPadding = null,
        builder = null,
        badgeType = null;

  const ImpaktfullUiTableRowItem.badge({
    required this.title,
    this.badgeType,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    this.theme,
    super.key,
  })  : type = ImpaktfullUiTableRowItemType.badge,
        _customPadding = null,
        subtitle = null,
        builder = null,
        onTap = null,
        onChanged = null,
        isSelected = false;

  /// Without a [padding], the custom cell only has 8px at the end.
  const ImpaktfullUiTableRowItem.custom({
    required this.builder,
    EdgeInsets? padding,
    this.theme,
    super.key,
  })  : type = ImpaktfullUiTableRowItemType.custom,
        padding = padding ?? const EdgeInsets.symmetric(horizontal: 16),
        _customPadding = padding,
        title = null,
        subtitle = null,
        badgeType = null,
        onTap = null,
        onChanged = null,
        isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        if (builder != null) {
          return Padding(
            padding: _customPadding ?? const EdgeInsetsDirectional.only(end: 8),
            child: builder!(context, componentTheme),
          );
        }
        if (type == ImpaktfullUiTableRowItemType.badge) {
          if (title == null || title!.isEmpty) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: padding,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: ImpaktfullUiBadge(
                type: badgeType ?? ImpaktfullUiBadgeType.primary,
                title: title!,
              ),
            ),
          );
        }
        return ImpaktfullUiTouchFeedback(
          onTap: onTap,
          child: Container(
            constraints:
                BoxConstraints(minHeight: componentTheme.dimens.minHeight),
            padding: padding,
            alignment: AlignmentDirectional.centerStart,
            child: ImpaktfullUiAutoLayout.horizontal(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (type == ImpaktfullUiTableRowItemType.checkbox) ...[
                  ImpaktfullUiCheckbox(
                    value: isSelected ?? false,
                    onChanged: onChanged,
                  ),
                ],
                // A checkbox without a text only needs the checkbox.
                if (title != null || subtitle != null) ...[
                  Expanded(
                    child: ImpaktfullUiAutoLayout.vertical(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (title != null) ...[
                          Text(
                            title!,
                            style: componentTheme.textStyles.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                        if (subtitle != null) ...[
                          Text(
                            subtitle!,
                            style: componentTheme.textStyles.subtitle
                                .withOpacity(0.5),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
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
