import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

export 'button_type.dart';
export 'button_style.dart';
export 'button_size.dart';

part 'button.describe.dart';

class ImpaktfullUiButton extends StatefulWidget with ComponentDescriptorMixin {
  final ImpaktfullUiButtonType type;
  final ImpaktfullUiButtonSize size;
  final IconData? leadingIcon;
  final Widget? leadingChild;
  final String? title;
  final IconData? trailingIcon;
  final Widget? trailingChild;
  final bool isLoading;
  final bool fullWidth;
  final AsyncCallback? onAsyncTap;
  final VoidCallback? onTap;
  final ImpaktfullUiButtonTheme? theme;

  const ImpaktfullUiButton({
    required this.type,
    this.title,
    this.size = ImpaktfullUiButtonSize.medium,
    this.leadingIcon,
    this.leadingChild,
    this.trailingIcon,
    this.trailingChild,
    this.fullWidth = false,
    this.isLoading = false,
    this.onTap,
    this.onAsyncTap,
    this.theme,
    super.key,
  });

  @override
  String describe() => _describeInstance(this);

  @override
  State<ImpaktfullUiButton> createState() => _ImpaktfullUiButtonState();
}

class _ImpaktfullUiButtonState extends State<ImpaktfullUiButton> {
  var _isLoading = false;

  bool get hasOnTap => widget.onTap != null || widget.onAsyncTap != null;
  @override
  Widget build(BuildContext context) {
    final iconSize = _getIconSize();
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiButtonTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, theme, componentTheme) {
        final textStyle = _getTextStyle(theme);
        final color = _getTextStyle(theme)?.color;
        final backgroundColor = _getBackgroundColor(componentTheme);
        final borderColor = _getBorderColor(componentTheme);
        return ImpaktfullUiTouchFeedback(
          color: backgroundColor,
          borderRadius: componentTheme.dimens.borderRadius,
          border: borderColor == null
              ? null
              : Border.all(
                  color: borderColor,
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
          onTap: widget.onTap == null && widget.onAsyncTap == null ? null : _onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: _isLoading ? 0 : 1,
                child: Padding(
                  padding: _getPadding(componentTheme),
                  child: ImpaktfullUiAutoLayout.horizontal(
                    mainAxisSize: widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 4,
                    children: [
                      if (widget.leadingChild != null) ...[
                        widget.leadingChild!,
                      ],
                      if (widget.leadingIcon != null) ...[
                        Icon(
                          widget.leadingIcon,
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
                      if (widget.trailingIcon != null) ...[
                        Icon(
                          widget.trailingIcon,
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
                duration: theme.durations.short,
                curve: Curves.easeInOut,
                child: ImpaktfullUiAutoLayout.horizontal(
                  mainAxisSize: widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 4,
                  children: [
                    Expanded(
                      flex: widget.fullWidth ? 1 : 0,
                      child: SizedBox(
                        height: _getLoadingSize(),
                        child: _isLoading ? ImpaktfullUiLoadingIndicator(color: color) : const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.tertiaryGrey:
      case ImpaktfullUiButtonType.link:
      case ImpaktfullUiButtonType.linkGrey:
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
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.tertiaryGrey:
      case ImpaktfullUiButtonType.link:
      case ImpaktfullUiButtonType.linkGrey:
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

  TextStyle? _getTextStyle(ImpaktfullUiTheme theme) {
    switch (widget.type) {
      case ImpaktfullUiButtonType.primary:
        return _getTextStyleBySize(theme.textStyles.onPrimary);
      case ImpaktfullUiButtonType.secondary:
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.link:
        return _getTextStyleBySize(theme.textStyles.onCardPrimary);
      case ImpaktfullUiButtonType.secondaryGrey:
      case ImpaktfullUiButtonType.tertiaryGrey:
      case ImpaktfullUiButtonType.linkGrey:
        return _getTextStyleBySize(theme.textStyles.onCard);
    }
  }

  TextStyle? _getTextStyleBySize(ImpaktfullUiTextStyleTheme textStyleTheme) {
    switch (widget.size) {
      case ImpaktfullUiButtonSize.extraSmall:
        return textStyleTheme.text.small.bold;
      case ImpaktfullUiButtonSize.small:
        return textStyleTheme.text.small.bold;
      case ImpaktfullUiButtonSize.medium:
        return textStyleTheme.text.small.bold;
      case ImpaktfullUiButtonSize.large:
        return textStyleTheme.text.small.bold;
      case ImpaktfullUiButtonSize.extraLarge:
        return textStyleTheme.text.small.bold;
    }
  }

  EdgeInsets _getPadding(ImpaktfullUiButtonTheme componentTheme) {
    switch (widget.type) {
      case ImpaktfullUiButtonType.primary:
      case ImpaktfullUiButtonType.secondary:
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.secondaryGrey:
      case ImpaktfullUiButtonType.tertiaryGrey:
        return EdgeInsets.symmetric(
          horizontal: widget.size.horizontalPadding,
          vertical: widget.size.verticalPadding,
        );
      case ImpaktfullUiButtonType.link:
      case ImpaktfullUiButtonType.linkGrey:
        return const EdgeInsets.symmetric(horizontal: 4);
    }
  }

  Future<void> _onTap() async {
    final onAsyncTap = widget.onAsyncTap;
    if (onAsyncTap != null) {
      setState(() => _isLoading = true);
      try {
        await onAsyncTap();
      } catch (error, trace) {
        debugPrint(error.toString());
        debugPrintStack(stackTrace: trace);
      }
      setState(() => _isLoading = false);
    } else if (widget.onTap != null) {
      widget.onTap?.call();
    }
  }
}
