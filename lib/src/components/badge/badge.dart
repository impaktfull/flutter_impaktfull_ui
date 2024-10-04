import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/badge/badge.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'badge_style.dart';
export 'badge_type.dart';
export 'badge_size.dart';

part 'badge.describe.dart';

class ImpaktfullUiBadge extends StatefulWidget with ComponentDescriptorMixin {
  final ImpaktfullUiBadgeType type;
  final ImpaktfullUiBadgeSize size;
  final String? label;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onCloseTap;
  final ImpaktfullUiBadgeTheme? theme;

  const ImpaktfullUiBadge({
    required this.type,
    required this.label,
    this.size = ImpaktfullUiBadgeSize.small,
    this.leading,
    this.trailing,
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
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiBadgeTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, theme, componentTheme) {
        final color = _getColor(theme);
        final textStyle = _getTextStyle(theme);
        return Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.05),
            border: Border.all(
              color: color.withOpacity(0.33),
              width: 1,
            ),
            borderRadius: componentTheme.dimens.borderRadius,
          ),
          padding: EdgeInsets.only(
            left: widget.leading == null
                ? widget.size.horizontalPadding
                : (widget.size.horizontalPadding / 2) -
                    widget.size.paddingOffset,
            right: widget.trailing == null
                ? widget.size.horizontalPadding
                : (widget.size.horizontalPadding / 2) -
                    widget.size.paddingOffset,
            top: widget.size.verticalPadding,
            bottom: widget.size.verticalPadding,
          ),
          child: ImpaktfullUiAutoLayout.horizontal(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.leading != null) ...[
                _getWidgetOrIcon(widget.leading!, color),
                SizedBox(width: widget.size.spacing),
              ],
              if (widget.label != null) ...[
                Text(
                  widget.label!,
                  style: textStyle.copyWith(color: color),
                ),
              ],
              if (widget.onCloseTap != null) ...[
                const SizedBox(width: 2),
                ImpaktfullUiTouchFeedback(
                  borderRadius: BorderRadius.circular(999),
                  onTap: widget.onCloseTap!,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: ImpaktfullUiAssetWidget(
                      asset: componentTheme.assets.close,
                      size: 16,
                      color: color.withOpacity(0.66),
                    ),
                  ),
                ),
              ] else if (widget.trailing != null) ...[
                SizedBox(width: widget.size.spacing),
                _getWidgetOrIcon(widget.trailing!, color),
              ]
            ],
          ),
        );
      },
    );
  }

  Color _getColor(ImpaktfullUiTheme theme) {
    switch (widget.type) {
      case ImpaktfullUiBadgeType.primary:
        return theme.colors.accent;
      case ImpaktfullUiBadgeType.secondary:
        return theme.colors.secondary;
      case ImpaktfullUiBadgeType.neutral:
        return theme.colors.text;
      case ImpaktfullUiBadgeType.error:
        return theme.colors.error;
      case ImpaktfullUiBadgeType.warning:
        return theme.colors.warning;
      case ImpaktfullUiBadgeType.success:
        return theme.colors.success;
    }
  }

  TextStyle _getTextStyle(ImpaktfullUiTheme theme) {
    switch (widget.size) {
      case ImpaktfullUiBadgeSize.small:
        return theme.textStyles.onCanvas.text.small;
      case ImpaktfullUiBadgeSize.medium:
        return theme.textStyles.onCanvas.text.small;
      case ImpaktfullUiBadgeSize.large:
        return theme.textStyles.onCanvas.text.small;
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
        color: color.withOpacity(0.66),
      );
    }
    if (widget is ImpaktfullUiAssetWidget) {
      return ImpaktfullUiAssetWidget(
        asset: widget.asset,
        size: this.widget.size.widgetSize,
        color: color.withOpacity(0.66),
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
