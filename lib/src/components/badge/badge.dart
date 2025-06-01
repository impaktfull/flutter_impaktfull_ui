import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/badge/badge.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'badge_style.dart';
export 'badge_type.dart';
export 'badge_size.dart';

part 'badge.describe.dart';

class ImpaktfullUiBadge extends StatefulWidget with ComponentDescriptorMixin {
  final ImpaktfullUiBadgeType type;
  final ImpaktfullUiBadgeSize size;
  final String? label;
  final Widget? leading;
  final ImpaktfullUiAsset? leadingAsset;
  final Widget? trailing;
  final ImpaktfullUiAsset? trailingAsset;
  final VoidCallback? onTap;
  final VoidCallback? onCloseTap;
  final ImpaktfullUiBadgeTheme? theme;

  const ImpaktfullUiBadge({
    required this.type,
    required this.label,
    this.size = ImpaktfullUiBadgeSize.small,
    this.leading,
    this.leadingAsset,
    this.trailing,
    this.trailingAsset,
    this.onTap,
    this.onCloseTap,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiBadge> createState() => _ImpaktfullUiBadgeState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiBadgeState extends State<ImpaktfullUiBadge> {
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        final hasLeading =
            widget.leading != null || widget.leadingAsset != null;
        final hasTrailing =
            widget.trailing != null || widget.trailingAsset != null;
        final textColor = _getColor(componentTheme);
        final borderColor = _getBorderColor(componentTheme);
        final backgroundColor = _getBackgroundColor(componentTheme);
        final textStyle = _getTextStyle(componentTheme);
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
            borderRadius: componentTheme.dimens.borderRadius,
          ),
          padding: EdgeInsets.only(
            left: hasLeading
                ? (widget.size.horizontalPadding / 2) -
                    widget.size.paddingOffset
                : widget.size.horizontalPadding,
            right: hasTrailing
                ? (widget.size.horizontalPadding / 2) -
                    widget.size.paddingOffset
                : widget.size.horizontalPadding,
            top: widget.size.verticalPadding,
            bottom: widget.size.verticalPadding,
          ),
          child: ImpaktfullUiAutoLayout.horizontal(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.leadingAsset != null) ...[
                _getWidgetOrIcon(
                  ImpaktfullUiAssetWidget(
                    asset: widget.leadingAsset!,
                  ),
                  textColor,
                ),
                SizedBox(width: widget.size.spacing),
              ],
              if (widget.leading != null) ...[
                _getWidgetOrIcon(widget.leading!, textColor),
                SizedBox(width: widget.size.spacing),
              ],
              if (widget.label != null) ...[
                Text(
                  widget.label!,
                  style: textStyle.copyWith(color: textColor),
                ),
              ],
              if (widget.onCloseTap != null) ...[
                const SizedBox(width: 2),
                ImpaktfullUiTouchFeedback(
                  borderRadius: componentTheme.dimens.borderRadius,
                  onTap: widget.onCloseTap!,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: ImpaktfullUiAssetWidget(
                      asset: componentTheme.assets.close,
                      size: 16,
                      color: textColor.withOpacityPercentage(0.66),
                    ),
                  ),
                ),
              ] else if (widget.trailingAsset != null) ...[
                SizedBox(width: widget.size.spacing),
                _getWidgetOrIcon(
                  ImpaktfullUiAssetWidget(
                    asset: widget.trailingAsset!,
                  ),
                  textColor,
                ),
              ] else if (widget.trailing != null) ...[
                SizedBox(width: widget.size.spacing),
                _getWidgetOrIcon(widget.trailing!, textColor),
              ]
            ],
          ),
        );
      },
    );
  }

  Color _getColor(ImpaktfullUiBadgeTheme componentTheme) {
    switch (widget.type) {
      case ImpaktfullUiBadgeType.primary:
        return componentTheme.colors.primaryText;
      case ImpaktfullUiBadgeType.secondary:
        return componentTheme.colors.secondaryText;
      case ImpaktfullUiBadgeType.neutral:
        return componentTheme.colors.neutralText;
      case ImpaktfullUiBadgeType.error:
        return componentTheme.colors.errorText;
      case ImpaktfullUiBadgeType.warning:
        return componentTheme.colors.warningText;
      case ImpaktfullUiBadgeType.success:
        return componentTheme.colors.successText;
    }
  }

  Color _getBorderColor(ImpaktfullUiBadgeTheme componentTheme) {
    switch (widget.type) {
      case ImpaktfullUiBadgeType.primary:
        return componentTheme.colors.primaryBorder;
      case ImpaktfullUiBadgeType.secondary:
        return componentTheme.colors.secondaryBorder;
      case ImpaktfullUiBadgeType.neutral:
        return componentTheme.colors.neutralBorder;
      case ImpaktfullUiBadgeType.error:
        return componentTheme.colors.errorBorder;
      case ImpaktfullUiBadgeType.warning:
        return componentTheme.colors.warningBorder;
      case ImpaktfullUiBadgeType.success:
        return componentTheme.colors.successBorder;
    }
  }

  Color _getBackgroundColor(ImpaktfullUiBadgeTheme componentTheme) {
    switch (widget.type) {
      case ImpaktfullUiBadgeType.primary:
        return componentTheme.colors.primaryBackground;
      case ImpaktfullUiBadgeType.secondary:
        return componentTheme.colors.secondaryBackground;
      case ImpaktfullUiBadgeType.neutral:
        return componentTheme.colors.neutralBackground;
      case ImpaktfullUiBadgeType.error:
        return componentTheme.colors.errorBackground;
      case ImpaktfullUiBadgeType.warning:
        return componentTheme.colors.warningBackground;
      case ImpaktfullUiBadgeType.success:
        return componentTheme.colors.successBackground;
    }
  }

  TextStyle _getTextStyle(ImpaktfullUiBadgeTheme componentTheme) {
    switch (widget.size) {
      case ImpaktfullUiBadgeSize.small:
        return componentTheme.textStyles.small;
      case ImpaktfullUiBadgeSize.medium:
        return componentTheme.textStyles.small;
      case ImpaktfullUiBadgeSize.large:
        return componentTheme.textStyles.small;
    }
  }

  Widget _getWidgetOrIcon(Widget widget, Color color) {
    if (widget is CustomBadgeWidget) {
      return widget;
    }
    if (widget is Icon) {
      return Icon(
        widget.icon,
        size: this.widget.size.widgetSize,
        color: color.withOpacityPercentage(0.66),
      );
    }
    if (widget is ImpaktfullUiAssetWidget) {
      return ImpaktfullUiAssetWidget(
        asset: widget.asset,
        size: this.widget.size.widgetSize,
        color: color.withOpacityPercentage(0.66),
      );
    }
    return SizedBox(
      width: this.widget.size.widgetSize,
      height: this.widget.size.widgetSize,
      child: widget,
    );
  }
}

class CustomBadgeWidget extends StatelessWidget {
  final Widget child;

  const CustomBadgeWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
