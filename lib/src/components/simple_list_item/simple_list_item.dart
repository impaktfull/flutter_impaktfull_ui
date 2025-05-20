import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/simple_list_item/simple_list_item.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'simple_list_item_style.dart';
export 'simple_list_item_type.dart';

part 'simple_list_item.describe.dart';

class ImpaktfullUiSimpleListItem extends StatelessWidget
    with ComponentDescriptorMixin {
  final String? title;
  final String? subtitle;
  final WidgetBuilder? leadingWidgetBuilder;
  final WidgetBuilder? centerWidgetBuilder;
  final WidgetBuilder? trailingWidgetBuilder;
  final ImpaktfullUiSimpleListItemType type;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final ImpaktfullUiSimpleListItemTheme? theme;

  const ImpaktfullUiSimpleListItem({
    required String this.title,
    this.subtitle,
    this.leadingWidgetBuilder,
    this.centerWidgetBuilder,
    this.trailingWidgetBuilder,
    this.onTap,
    this.padding,
    this.borderRadius,
    this.type = ImpaktfullUiSimpleListItemType.neutral,
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
    this.padding,
    this.borderRadius,
    this.type = ImpaktfullUiSimpleListItemType.neutral,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiSimpleListItemTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiTouchFeedback(
        onTap: onTap,
        color: componentTheme.colors.background,
        borderRadius: borderRadius ?? componentTheme.dimens.borderRadius,
        child: Padding(
          padding: padding ?? componentTheme.dimens.padding,
          child: ImpaktfullUiAutoLayout.horizontal(
            crossAxisAlignment: componentTheme.dimens.crossAxisAlignment,
            spacing: componentTheme.dimens.spacing,
            children: [
              if (leadingWidgetBuilder != null) ...[
                _buildCorrectWidget(
                    leadingWidgetBuilder!(context), componentTheme),
              ],
              if (centerWidgetBuilder == null) ...[
                Expanded(
                  child: ImpaktfullUiAutoLayout.vertical(
                    spacing: 2,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title!,
                        style: _getTitleTextStyle(componentTheme),
                      ),
                      if (subtitle != null) ...[
                        Text(
                          subtitle!,
                          style: _getSubtitleTextStyle(componentTheme),
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
                _buildCorrectWidget(
                    trailingWidgetBuilder!(context), componentTheme),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  TextStyle _getTitleTextStyle(ImpaktfullUiSimpleListItemTheme componentTheme) {
    switch (type) {
      case ImpaktfullUiSimpleListItemType.neutral:
        return componentTheme.textStyles.title;
      case ImpaktfullUiSimpleListItemType.danger:
        return componentTheme.textStyles.titleDanger;
    }
  }

  TextStyle _getSubtitleTextStyle(
      ImpaktfullUiSimpleListItemTheme componentTheme) {
    switch (type) {
      case ImpaktfullUiSimpleListItemType.neutral:
        return componentTheme.textStyles.subtitle;
      case ImpaktfullUiSimpleListItemType.danger:
        return componentTheme.textStyles.subtitleDanger;
    }
  }

  Widget _buildCorrectWidget(
      Widget widget, ImpaktfullUiSimpleListItemTheme componentTheme) {
    if (widget is ImpaktfullUiAssetWidget) {
      return ImpaktfullUiAssetWidget(
        asset: widget.asset,
        color: widget.color ?? _getTitleTextStyle(componentTheme).color,
      );
    }
    return widget;
  }
}
