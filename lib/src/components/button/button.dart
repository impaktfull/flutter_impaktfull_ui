import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/button/raised_button.dart';
import 'package:impaktfull_ui/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/util/vibrate/vibrate.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'button_type.dart';
export 'button_style.dart';
export 'button_size.dart';

part 'button.describe.dart';

class ImpaktfullUiButton extends StatefulWidget with ComponentDescriptorMixin {
  final ImpaktfullUiButtonType type;
  final ImpaktfullUiButtonSize size;
  final ImpaktfullUiAsset? leadingAsset;
  final Widget? leadingChild;
  final String? title;
  final ImpaktfullUiAsset? trailingAsset;
  final Widget? trailingChild;
  final bool isLoading;
  final bool fullWidth;
  final bool canRequestFocus;
  final AsyncCallback? onAsyncTap;
  final VoidCallback? onTap;
  final String? tooltip;
  final ImpaktfullUiButtonTheme? theme;

  const ImpaktfullUiButton({
    required this.type,
    this.title,
    this.size = ImpaktfullUiButtonSize.medium,
    this.leadingAsset,
    this.leadingChild,
    this.trailingAsset,
    this.trailingChild,
    this.fullWidth = false,
    this.isLoading = false,
    this.canRequestFocus = true,
    this.onTap,
    this.onAsyncTap,
    this.tooltip,
    this.theme,
    super.key,
  });

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  @override
  State<ImpaktfullUiButton> createState() => _ImpaktfullUiButtonState();
}

class _ImpaktfullUiButtonState extends State<ImpaktfullUiButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        final iconSize = _getIconSize();
        final textStyle = _getTextStyle(componentTheme);
        final color = textStyle?.color;
        final backgroundColor = _getBackgroundColor(componentTheme);
        final borderColor = _getBorderColor(componentTheme);
        final isDisabled = widget.onTap == null && widget.onAsyncTap == null;
        final isClickable = !isDisabled && !_isLoading;
        return Opacity(
          opacity: isDisabled ? 0.5 : 1,
          child: ImpaktfullUiRaisedButton(
            type: widget.type,
            isLoading: _isLoading,
            theme: componentTheme,
            onTap: isClickable && _getIsRaisedButtonAllowed(componentTheme)
                ? () => _onTap(componentTheme)
                : null,
            child: ImpaktfullUiTouchFeedback(
              color: backgroundColor,
              canRequestFocus: widget.canRequestFocus,
              borderRadius: componentTheme.dimens.borderRadius,
              shadow: _getShadow(componentTheme),
              toolTip: widget.tooltip,
              border: borderColor == null
                  ? null
                  : Border.all(
                      color: borderColor,
                      width: componentTheme.dimens.borderWidth,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
              onTap: isClickable && !_getIsRaisedButtonAllowed(componentTheme)
                  ? () => _onTap(componentTheme)
                  : null,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: _isLoading ? 0 : 1,
                    child: Padding(
                      padding: _getPadding(componentTheme),
                      child: ImpaktfullUiAutoLayout.horizontal(
                        mainAxisSize: widget.fullWidth
                            ? MainAxisSize.max
                            : MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          if (widget.leadingChild != null) ...[
                            widget.leadingChild!,
                          ],
                          if (widget.leadingAsset != null) ...[
                            ImpaktfullUiAssetWidget(
                              asset: widget.leadingAsset,
                              color: color,
                              size: iconSize,
                            ),
                          ],
                          if (widget.title != null) ...[
                            Expanded(
                              flex: widget.fullWidth ? 1 : 0,
                              child: Text(
                                widget.title!,
                                textAlign: TextAlign.center,
                                style: textStyle,
                              ),
                            ),
                          ],
                          if (widget.trailingAsset != null) ...[
                            ImpaktfullUiAssetWidget(
                              asset: widget.trailingAsset,
                              color: color,
                              size: iconSize,
                            ),
                          ],
                          if (widget.trailingChild != null) ...[
                            widget.trailingChild!,
                          ],
                        ],
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: _isLoading ? 1 : 0,
                    duration: componentTheme.durations.loading,
                    curve: Curves.easeInOut,
                    child: ImpaktfullUiAutoLayout.horizontal(
                      mainAxisSize: widget.fullWidth
                          ? MainAxisSize.max
                          : MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 4,
                      children: [
                        Expanded(
                          flex: widget.fullWidth ? 1 : 0,
                          child: SizedBox(
                            height: _getLoadingSize(),
                            child: _isLoading
                                ? ImpaktfullUiLoadingIndicator(color: color)
                                : const SizedBox(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Color? _getBackgroundColor(ImpaktfullUiButtonTheme componentTheme) {
    final colors = componentTheme.colors;
    switch (widget.type) {
      case ImpaktfullUiButtonType.primary:
        return colors.primary;
      case ImpaktfullUiButtonType.secondary:
        return colors.secondary;
      case ImpaktfullUiButtonType.secondaryGrey:
        return colors.secondary;
      case ImpaktfullUiButtonType.destructivePrimary:
        return colors.destructive;
      case ImpaktfullUiButtonType.destructiveSecondary:
        return colors.secondary;
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.tertiaryGrey:
      case ImpaktfullUiButtonType.link:
      case ImpaktfullUiButtonType.linkGrey:
      case ImpaktfullUiButtonType.destructiveTertiary:
      case ImpaktfullUiButtonType.destructiveLink:
        return null;
    }
  }

  Color? _getBorderColor(ImpaktfullUiButtonTheme componentTheme) {
    final colors = componentTheme.colors;
    switch (widget.type) {
      case ImpaktfullUiButtonType.primary:
        return colors.primaryBorder;
      case ImpaktfullUiButtonType.secondary:
        return colors.secondaryBorder;
      case ImpaktfullUiButtonType.secondaryGrey:
        return colors.secondaryBorder;
      case ImpaktfullUiButtonType.destructivePrimary:
      case ImpaktfullUiButtonType.destructiveSecondary:
        return colors.destructiveBorder;
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.tertiaryGrey:
      case ImpaktfullUiButtonType.link:
      case ImpaktfullUiButtonType.linkGrey:
      case ImpaktfullUiButtonType.destructiveTertiary:
      case ImpaktfullUiButtonType.destructiveLink:
        return null;
    }
  }

  double? _getIconSize() {
    switch (widget.size) {
      case ImpaktfullUiButtonSize.extraSmall:
      case ImpaktfullUiButtonSize.small:
      case ImpaktfullUiButtonSize.medium:
      case ImpaktfullUiButtonSize.large:
        return 20;
      case ImpaktfullUiButtonSize.extraLarge:
        return 24;
    }
  }

  double? _getLoadingSize() {
    switch (widget.size) {
      case ImpaktfullUiButtonSize.extraSmall:
        return 24;
      case ImpaktfullUiButtonSize.small:
      case ImpaktfullUiButtonSize.medium:
        return 32;
      case ImpaktfullUiButtonSize.large:
        return 40;
      case ImpaktfullUiButtonSize.extraLarge:
        return 48;
    }
  }

  TextStyle? _getTextStyle(ImpaktfullUiButtonTheme theme) {
    switch (widget.type) {
      case ImpaktfullUiButtonType.primary:
        return theme.textStyles.primary;
      case ImpaktfullUiButtonType.secondary:
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.link:
        return theme.textStyles.alternative;
      case ImpaktfullUiButtonType.secondaryGrey:
      case ImpaktfullUiButtonType.tertiaryGrey:
      case ImpaktfullUiButtonType.linkGrey:
        return theme.textStyles.grey;
      case ImpaktfullUiButtonType.destructivePrimary:
        return theme.textStyles.destructivePrimary;
      case ImpaktfullUiButtonType.destructiveSecondary:
      case ImpaktfullUiButtonType.destructiveTertiary:
      case ImpaktfullUiButtonType.destructiveLink:
        return theme.textStyles.destructiveAlternative;
    }
  }

  EdgeInsets _getPadding(ImpaktfullUiButtonTheme componentTheme) {
    switch (widget.type) {
      case ImpaktfullUiButtonType.primary:
      case ImpaktfullUiButtonType.secondary:
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.secondaryGrey:
      case ImpaktfullUiButtonType.tertiaryGrey:
      case ImpaktfullUiButtonType.destructivePrimary:
      case ImpaktfullUiButtonType.destructiveSecondary:
      case ImpaktfullUiButtonType.destructiveTertiary:
        return EdgeInsets.symmetric(
          horizontal: widget.size.horizontalPadding,
          vertical: widget.size.verticalPadding,
        );
      case ImpaktfullUiButtonType.link:
      case ImpaktfullUiButtonType.linkGrey:
      case ImpaktfullUiButtonType.destructiveLink:
        return const EdgeInsets.symmetric(horizontal: 4);
    }
  }

  Future<void> _onTap(ImpaktfullUiButtonTheme componentTheme) async {
    final onAsyncTap = widget.onAsyncTap;
    if (componentTheme.config.vibrateOnTap) {
      Vibrate.vibrate();
    }
    if (onAsyncTap != null) {
      setState(() => _isLoading = true);
      try {
        await onAsyncTap();
      } catch (error, trace) {
        debugPrint(error.toString());
        debugPrintStack(stackTrace: trace);
      }
      if (!mounted) return;
      setState(() => _isLoading = false);
    } else if (widget.onTap != null) {
      widget.onTap?.call();
    }
  }

  List<BoxShadow> _getShadow(ImpaktfullUiButtonTheme componentTheme) {
    final shadowTheme = componentTheme.shadow;
    if (shadowTheme == null) return [];
    switch (widget.type) {
      case ImpaktfullUiButtonType.primary:
        return shadowTheme.primary ?? [];
      case ImpaktfullUiButtonType.secondary:
      case ImpaktfullUiButtonType.secondaryGrey:
        return shadowTheme.secondary ?? [];
      case ImpaktfullUiButtonType.destructivePrimary:
      case ImpaktfullUiButtonType.destructiveSecondary:
        return shadowTheme.destructive ?? [];
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.tertiaryGrey:
      case ImpaktfullUiButtonType.link:
      case ImpaktfullUiButtonType.linkGrey:
      case ImpaktfullUiButtonType.destructiveTertiary:
      case ImpaktfullUiButtonType.destructiveLink:
        return [];
    }
  }

  bool _getIsRaisedButtonAllowed(ImpaktfullUiButtonTheme componentTheme) {
    switch (widget.type) {
      case ImpaktfullUiButtonType.primary:
      case ImpaktfullUiButtonType.secondary:
      case ImpaktfullUiButtonType.secondaryGrey:
      case ImpaktfullUiButtonType.destructivePrimary:
      case ImpaktfullUiButtonType.destructiveSecondary:
        return componentTheme.config.isRaised;
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.tertiaryGrey:
      case ImpaktfullUiButtonType.link:
      case ImpaktfullUiButtonType.linkGrey:
      case ImpaktfullUiButtonType.destructiveTertiary:
      case ImpaktfullUiButtonType.destructiveLink:
        return false;
    }
  }
}
