import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/util/animation/animation_util.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/button/raised_button.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/focus_feedback/focus_feedback.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/hover_feedback/hover_feedback.dart';
import 'package:impaktfull_ui/src/components/loading_indicator/loading_indicator.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/util/extension/edge_insets_geometry_extension.dart';
import 'package:impaktfull_ui/src/util/vibrate/vibrate.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'button_type.dart';
export 'button_style.dart';
export 'button_size.dart';

class ImpaktfullUiButton extends StatefulWidget {
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
  State<ImpaktfullUiButton> createState() => _ImpaktfullUiButtonState();
}

class _ImpaktfullUiButtonState extends State<ImpaktfullUiButton> {
  var _isAsyncLoading = false;
  var _showFocusHighlight = false;
  var _isPressed = false;

  bool get _isLoading => widget.isLoading || _isAsyncLoading;

  bool get _isDisabled => widget.onTap == null && widget.onAsyncTap == null;

  bool get _isClickable => !_isDisabled && !_isLoading;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        // The pointer is only tracked when the theme has a colour for the
        // hovered state: without one the hover of the touch feedback overlay
        // is the only feedback, like before these tokens existed.
        final tracksHover =
            _isClickable && _getHoverColors(componentTheme) != null;
        if (!tracksHover) {
          return _buildButton(context, componentTheme, isHovered: false);
        }
        return ImpaktfullUiHoverFeedback(
          canRequestFocus: widget.canRequestFocus,
          builder: (context, isHovered) => _buildButton(
            context,
            componentTheme,
            isHovered: isHovered,
          ),
        );
      },
    );
  }

  Widget _buildButton(
    BuildContext context,
    ImpaktfullUiButtonTheme componentTheme, {
    required bool isHovered,
  }) {
    final sizeDimens = componentTheme.dimens.sizes.bySize(widget.size);
    final isDisabled = _isDisabled;
    final isClickable = _isClickable;
    final isRaised = _getIsRaisedButtonAllowed(componentTheme);
    final stateColors = _getStateColors(
      componentTheme,
      isDisabled: isDisabled,
      isHovered: isHovered,
    );
    final iconSize = sizeDimens.iconSize;
    final textStyle = _getTextStyle(componentTheme, stateColors);
    final color = textStyle?.color;
    final backgroundColor =
        stateColors?.background ?? _getBackgroundColor(componentTheme);
    final borderColor = stateColors?.border ?? _getBorderColor(componentTheme);
    // A pressed colour is only reachable when the button handles the pointer
    // itself: a raised button shows its press with the raised animation.
    final tracksPressed =
        isClickable && !isRaised && _getPressedColors(componentTheme) != null;
    final button = ImpaktfullUiRaisedButton(
      type: widget.type,
      isLoading: _isLoading,
      theme: componentTheme,
      onTap: isClickable && isRaised ? () => _onTap(componentTheme) : null,
      child: ImpaktfullUiTouchFeedback(
        color: backgroundColor,
        canRequestFocus: widget.canRequestFocus,
        borderRadius: componentTheme.dimens.borderRadius,
        shadow: _getShadow(componentTheme),
        tooltip: widget.tooltip,
        border: borderColor == null
            ? null
            : Border.all(
                color: borderColor,
                width: componentTheme.dimens.borderWidth,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
        onTap: isClickable && !isRaised ? () => _onTap(componentTheme) : null,
        onTapDown: tracksPressed ? (_) => _setPressed(true) : null,
        onTapUp: tracksPressed ? (_) => _setPressed(false) : null,
        onTapCancel: tracksPressed ? () => _setPressed(false) : null,
        child: _withHeight(
          sizeDimens.height,
          Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: _isLoading ? 0 : 1,
                child: Padding(
                  padding: _getPadding(componentTheme),
                  child: ImpaktfullUiAutoLayout.horizontal(
                    mainAxisSize:
                        widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: sizeDimens.spacing,
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
                        // Loose, not flex 0: a title that is wider than the
                        // button can be wraps instead of overflowing. A
                        // loose flexible child is allowed in a
                        // MainAxisSize.min row without a width bound.
                        Flexible(
                          fit: widget.fullWidth ? FlexFit.tight : FlexFit.loose,
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
                duration: ImpaktfullUiAnimationUtil.duration(
                    context, componentTheme.durations.loading),
                curve: Curves.easeInOut,
                child: ImpaktfullUiAutoLayout.horizontal(
                  mainAxisSize:
                      widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: sizeDimens.spacing,
                  children: [
                    Expanded(
                      flex: widget.fullWidth ? 1 : 0,
                      child: SizedBox(
                        height: sizeDimens.loadingSize,
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
    return Semantics(
      container: true,
      button: true,
      enabled: !isDisabled,
      child: Opacity(
        // With a colour for the disabled state the button keeps its opacity,
        // so its border and its shadow stay crisp.
        opacity: isDisabled && stateColors == null ? 0.5 : 1,
        child: isRaised
            ? _buildRaisedKeyboardActivator(
                componentTheme: componentTheme,
                isClickable: isClickable,
                child: button,
              )
            : button,
      ),
    );
  }

  /// Centers [child] in a box of [height], and lets the box grow when the
  /// content does not fit (e.g. a title that wraps to two lines).
  Widget _withHeight(double? height, Widget child) {
    if (height == null) return child;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height),
      child: child,
    );
  }

  void _setPressed(bool value) {
    if (_isPressed == value) return;
    setState(() => _isPressed = value);
  }

  /// A raised button handles pointer taps in [ImpaktfullUiRaisedButton] (for
  /// the press animation), so the touch feedback can not be focused. Make it
  /// focusable and activatable with the keyboard here.
  Widget _buildRaisedKeyboardActivator({
    required ImpaktfullUiButtonTheme componentTheme,
    required bool isClickable,
    required Widget child,
  }) {
    void onActivate() => _onTap(componentTheme);
    return FocusableActionDetector(
      enabled: isClickable && widget.canRequestFocus,
      onShowFocusHighlight: (value) {
        if (_showFocusHighlight == value) return;
        setState(() => _showFocusHighlight = value);
      },
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) => onActivate(),
        ),
        ButtonActivateIntent: CallbackAction<ButtonActivateIntent>(
          onInvoke: (_) => onActivate(),
        ),
      },
      child: ImpaktfullUiFocusFeedback(
        hasFocus: _showFocusHighlight && isClickable,
        borderRadius: componentTheme.dimens.borderRadius,
        child: child,
      ),
    );
  }

  /// The colours of the state the button is in, or null when the theme has no
  /// colours for it: the button then renders like it always did (an overlay
  /// for hover and pressed, `Opacity(0.5)` for disabled).
  ImpaktfullUiButtonStateColorTheme? _getStateColors(
    ImpaktfullUiButtonTheme componentTheme, {
    required bool isDisabled,
    required bool isHovered,
  }) {
    if (isDisabled) return _getDisabledColors(componentTheme);
    if (_isPressed) {
      return _getPressedColors(componentTheme) ??
          _getHoverColors(componentTheme);
    }
    if (isHovered) return _getHoverColors(componentTheme);
    return null;
  }

  ImpaktfullUiButtonStateColorTheme? _getHoverColors(
      ImpaktfullUiButtonTheme componentTheme) {
    final colors = componentTheme.colors;
    switch (widget.type) {
      case ImpaktfullUiButtonType.primary:
        return colors.primaryHover;
      case ImpaktfullUiButtonType.secondary:
      case ImpaktfullUiButtonType.secondaryGrey:
      case ImpaktfullUiButtonType.destructiveSecondary:
        return colors.secondaryHover;
      case ImpaktfullUiButtonType.destructivePrimary:
        return colors.destructiveHover;
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.tertiaryGrey:
      case ImpaktfullUiButtonType.link:
      case ImpaktfullUiButtonType.linkGrey:
      case ImpaktfullUiButtonType.destructiveTertiary:
      case ImpaktfullUiButtonType.destructiveLink:
        return colors.tertiaryHover;
    }
  }

  ImpaktfullUiButtonStateColorTheme? _getPressedColors(
      ImpaktfullUiButtonTheme componentTheme) {
    final colors = componentTheme.colors;
    switch (widget.type) {
      case ImpaktfullUiButtonType.primary:
        return colors.primaryPressed;
      case ImpaktfullUiButtonType.secondary:
      case ImpaktfullUiButtonType.secondaryGrey:
      case ImpaktfullUiButtonType.destructiveSecondary:
        return colors.secondaryPressed;
      case ImpaktfullUiButtonType.destructivePrimary:
        return colors.destructivePressed;
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.tertiaryGrey:
      case ImpaktfullUiButtonType.link:
      case ImpaktfullUiButtonType.linkGrey:
      case ImpaktfullUiButtonType.destructiveTertiary:
      case ImpaktfullUiButtonType.destructiveLink:
        return colors.tertiaryPressed;
    }
  }

  ImpaktfullUiButtonStateColorTheme? _getDisabledColors(
      ImpaktfullUiButtonTheme componentTheme) {
    final colors = componentTheme.colors;
    switch (widget.type) {
      case ImpaktfullUiButtonType.primary:
        return colors.primaryDisabled;
      case ImpaktfullUiButtonType.secondary:
      case ImpaktfullUiButtonType.secondaryGrey:
      case ImpaktfullUiButtonType.destructiveSecondary:
        return colors.secondaryDisabled;
      case ImpaktfullUiButtonType.destructivePrimary:
        return colors.destructiveDisabled;
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.tertiaryGrey:
      case ImpaktfullUiButtonType.link:
      case ImpaktfullUiButtonType.linkGrey:
      case ImpaktfullUiButtonType.destructiveTertiary:
      case ImpaktfullUiButtonType.destructiveLink:
        return colors.tertiaryDisabled;
    }
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

  TextStyle? _getTextStyle(
    ImpaktfullUiButtonTheme theme,
    ImpaktfullUiButtonStateColorTheme? stateColors,
  ) {
    final textStyle = _getBaseTextStyle(theme);
    final color = stateColors?.text;
    if (color == null) return textStyle;
    return textStyle.copyWith(color: color);
  }

  TextStyle _getBaseTextStyle(ImpaktfullUiButtonTheme theme) {
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

  EdgeInsetsGeometry _getPadding(ImpaktfullUiButtonTheme componentTheme) {
    final sizeDimens = componentTheme.dimens.sizes.bySize(widget.size);
    final padding =
        _isLinkType ? componentTheme.dimens.linkPadding : sizeDimens.padding;
    if (sizeDimens.height == null) return padding;
    // With a height the content is centered in it: vertical padding would
    // only make the button taller than the height it is given.
    return EdgeInsetsDirectional.only(
      start: padding.start,
      end: padding.end,
    );
  }

  bool get _isLinkType {
    switch (widget.type) {
      case ImpaktfullUiButtonType.link:
      case ImpaktfullUiButtonType.linkGrey:
      case ImpaktfullUiButtonType.destructiveLink:
        return true;
      case ImpaktfullUiButtonType.primary:
      case ImpaktfullUiButtonType.secondary:
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.secondaryGrey:
      case ImpaktfullUiButtonType.tertiaryGrey:
      case ImpaktfullUiButtonType.destructivePrimary:
      case ImpaktfullUiButtonType.destructiveSecondary:
      case ImpaktfullUiButtonType.destructiveTertiary:
        return false;
    }
  }

  Future<void> _onTap(ImpaktfullUiButtonTheme componentTheme) async {
    if (_isLoading) return;
    final onAsyncTap = widget.onAsyncTap;
    if (componentTheme.config.vibrateOnTap) {
      Vibrate.vibrate();
    }
    if (onAsyncTap != null) {
      setState(() => _isAsyncLoading = true);
      try {
        await onAsyncTap();
      } catch (error, trace) {
        debugPrint(error.toString());
        debugPrintStack(stackTrace: trace);
      }
      if (!mounted) return;
      setState(() => _isAsyncLoading = false);
    } else if (widget.onTap != null) {
      widget.onTap?.call();
    }
  }

  List<BoxShadow> _getShadow(ImpaktfullUiButtonTheme componentTheme) {
    final shadowTheme = componentTheme.shadows;
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
