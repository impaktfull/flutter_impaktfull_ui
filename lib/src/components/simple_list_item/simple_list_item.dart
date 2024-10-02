import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/simple_list_item/simple_list_item_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'simple_list_item_style.dart';

part 'simple_list_item.describe.dart';

enum ImpaktfullUiListItemType {
  neutral,
  danger,
}

class ImpaktfullUiSimpleListItem extends StatelessWidget
    with ComponentDescriptorMixin {
  final String? title;
  final String? subtitle;
  final WidgetBuilder? leadingWidgetBuilder;
  final WidgetBuilder? centerWidgetBuilder;
  final WidgetBuilder? trailingWidgetBuilder;
  final ImpaktfullUiListItemType type;
  final VoidCallback? onTap;
  final double spacing;
  final ImpaktfullUiSimpleListItemTheme? theme;

  const ImpaktfullUiSimpleListItem({
    required String this.title,
    this.subtitle,
    this.leadingWidgetBuilder,
    this.centerWidgetBuilder,
    this.trailingWidgetBuilder,
    this.onTap,
    this.spacing = 8,
    this.type = ImpaktfullUiListItemType.neutral,
    this.theme,
    super.key,
  });

  const ImpaktfullUiSimpleListItem.custom({
    required String this.title,
    this.subtitle,
    this.leadingWidgetBuilder,
    this.centerWidgetBuilder,
    this.trailingWidgetBuilder,
    this.onTap,
    this.spacing = 8,
    this.type = ImpaktfullUiListItemType.neutral,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiSimpleListItemTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => ImpaktfullUiTouchFeedback(
        onTap: onTap,
        color: componentTheme.colors.background,
        child: Padding(
          padding: componentTheme.dimens.padding,
          child: ImpaktfullUiAutoLayout.horizontal(
            crossAxisAlignment: componentTheme.dimens.crossAxisAlignment,
            spacing: spacing,
            children: [
              if (leadingWidgetBuilder != null) ...[
                leadingWidgetBuilder!(context),
              ],
              if (centerWidgetBuilder == null) ...[
                Expanded(
                  child: ImpaktfullUiAutoLayout.vertical(
                    spacing: 2,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title!,
                        style: componentTheme.textStyles.title,
                      ),
                      if (subtitle != null) ...[
                        Text(
                          subtitle!,
                          style: componentTheme.textStyles.subtitle,
                        ),
                      ],
                    ],
                  ),
                ),
              ] else ...[
                Expanded(
                  child: centerWidgetBuilder!(context),
                ),
              ],
              if (trailingWidgetBuilder != null) ...[
                trailingWidgetBuilder!(context),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
