import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/badge/badge.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'badge_style.dart';
export 'badge_type.dart';
export 'badge_size.dart';

class ImpaktfullUiBadge extends StatefulWidget {
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
        return ImpaktfullUiTouchFeedback(
          onTap: widget.onTap,
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: componentTheme.dimens.borderWidth,
          ),
          borderRadius: componentTheme.dimens.borderRadius,
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: hasLeading
                  ? (widget.size.horizontalPadding / 2) -
                      widget.size.paddingOffset
                  : widget.size.horizontalPadding,
              end: hasTrailing
                  ? (widget.size.horizontalPadding / 2) -
                      widget.size.paddingOffset
                  : widget.size.horizontalPadding,
              top: widget.size.verticalPadding,
              bottom: widget.size.verticalPadding,
            ),
            // With a bounded width a long label is truncated. Without one
            // (e.g. in a Row) the badge keeps the width of its content.
            child: _ImpaktfullUiBadgeRow(
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
                  Flexible(
                    child: Text(
                      widget.label!,
                      style: textStyle.copyWith(color: textColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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
        return componentTheme.textStyles.medium;
      case ImpaktfullUiBadgeSize.large:
        return componentTheme.textStyles.large;
    }
  }

  Widget _getWidgetOrIcon(Widget widget, Color color) {
    if (widget is ImpaktfullUiCustomBadgeWidget) {
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

class ImpaktfullUiCustomBadgeWidget extends StatelessWidget {
  final Widget child;

  const ImpaktfullUiCustomBadgeWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

/// A horizontal [Flex] with [MainAxisSize.min] whose [Flexible] children only
/// flex when the width is bounded. A [Row] throws for a flexible child in an
/// unbounded width (e.g. a badge in a Row), a LayoutBuilder does not support
/// intrinsic dimensions (e.g. a badge in a Table or IntrinsicWidth).
class _ImpaktfullUiBadgeRow extends Flex {
  const _ImpaktfullUiBadgeRow({
    required super.children,
  }) : super(
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
        );

  @override
  RenderFlex createRenderObject(BuildContext context) => _RenderBadgeRow(
        direction: direction,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: getEffectiveTextDirection(context),
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        clipBehavior: clipBehavior,
      );
}

class _RenderBadgeRow extends RenderFlex {
  _RenderBadgeRow({
    super.direction,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.clipBehavior,
  });

  /// Runs [callback] with the flex of every child disabled when the width is
  /// unbounded or the content fits, and restores the flex afterwards.
  T _withFlexFor<T>(BoxConstraints constraints, T Function() callback) {
    // Only flex when the content does not fit: otherwise the children are
    // laid out exactly like in a Row.
    if (constraints.hasBoundedWidth &&
        getMaxIntrinsicWidth(double.infinity) > constraints.maxWidth) {
      return callback();
    }
    final flexChildren = <FlexParentData, int?>{};
    var child = firstChild;
    while (child != null) {
      final parentData = child.parentData! as FlexParentData;
      flexChildren[parentData] = parentData.flex;
      parentData.flex = null;
      child = parentData.nextSibling;
    }
    try {
      return callback();
    } finally {
      for (final entry in flexChildren.entries) {
        entry.key.flex = entry.value;
      }
    }
  }

  @override
  void performLayout() => _withFlexFor(constraints, super.performLayout);

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) =>
      _withFlexFor(constraints, () => super.computeDryLayout(constraints));
}
