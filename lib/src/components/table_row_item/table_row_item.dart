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
  final EdgeInsets? _padding;

  const ImpaktfullUiTableRowItem.text({
    required String this.title,
    this.subtitle,
    this.onTap,

    /// The padding of the cell. Without one, the `padding` of the
    /// [ImpaktfullUiTableRowItemTheme] is used (16 horizontal by default).
    EdgeInsets? padding,
    this.theme,
    super.key,
  })  : type = ImpaktfullUiTableRowItemType.text,
        _padding = padding,
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

    /// The padding of the cell. Without one, the `padding` of the
    /// [ImpaktfullUiTableRowItemTheme] is used (16 horizontal by default).
    EdgeInsets? padding,
    this.theme,
    super.key,
  })  : type = ImpaktfullUiTableRowItemType.checkbox,
        _padding = padding,
        builder = null,
        badgeType = null;

  const ImpaktfullUiTableRowItem.badge({
    required this.title,
    this.badgeType,

    /// The padding of the cell. Without one, the `padding` of the
    /// [ImpaktfullUiTableRowItemTheme] is used (16 horizontal by default).
    EdgeInsets? padding,
    this.theme,
    super.key,
  })  : type = ImpaktfullUiTableRowItemType.badge,
        _padding = padding,
        subtitle = null,
        builder = null,
        onTap = null,
        onChanged = null,
        isSelected = false;

  /// Without a [padding], the custom cell uses the `customPadding` of the
  /// [ImpaktfullUiTableRowItemTheme] (8px at the end by default).
  const ImpaktfullUiTableRowItem.custom({
    required this.builder,
    EdgeInsets? padding,
    this.theme,
    super.key,
  })  : type = ImpaktfullUiTableRowItemType.custom,
        _padding = padding,
        title = null,
        subtitle = null,
        badgeType = null,
        onTap = null,
        onChanged = null,
        isSelected = false;

  /// The padding that was passed to the constructor, or
  /// `EdgeInsets.symmetric(horizontal: 16)` (the padding of the default
  /// theme) when none was passed. Without a padding, the cell uses the
  /// `padding` (or `customPadding`) of the [ImpaktfullUiTableRowItemTheme].
  EdgeInsets get padding =>
      _padding ?? const EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final padding = _padding ?? componentTheme.dimens.padding;
        if (builder != null) {
          return Padding(
            padding: _padding ?? componentTheme.dimens.customPadding,
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
              spacing: componentTheme.dimens.spacing,
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
