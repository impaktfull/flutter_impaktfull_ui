import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

export 'button_type.dart';
export 'button_style.dart';
export 'button_size.dart';

class ImpaktfullUiButton extends StatefulWidget {
  final ImpaktfullUiButtonType type;
  final ImpaktfullUiButtonSize size;
  final IconData? leadingIcon;
  final String? title;
  final IconData? trailingIcon;
  final bool isLoading;
  final bool fullWidth;
  final VoidCallback? onAsyncTap;
  final VoidCallback? onTap;
  final ImpaktfullUiButtonTheme? theme;

  const ImpaktfullUiButton({
    required this.type,
    this.title,
    this.size = ImpaktfullUiButtonSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.fullWidth = false,
    this.isLoading = false,
    this.onTap,
    this.onAsyncTap,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiButton> createState() => _ImpaktfullUiButtonState();
}

class _ImpaktfullUiButtonState extends State<ImpaktfullUiButton> {
  bool get hasOnTap => widget.onTap != null || widget.onAsyncTap != null;
  @override
  Widget build(BuildContext context) {
    final iconSize = _getIconSize();
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiButtonTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, theme, componentTheme) {
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
          child: Padding(
            padding: _getPadding(componentTheme),
            child: ImpaktfullUiAutoLayout.horizontal(
              mainAxisSize: widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 4,
              children: [
                if (widget.leadingIcon != null) ...[
                  Icon(
                    widget.leadingIcon,
                    color: color,
                    size: iconSize,
                  ),
                ],
                if (widget.title != null) ...[
                  Text(
                    widget.title!,
                    textAlign: TextAlign.center,
                    style: _getTextStyle(theme),
                  ),
                ],
                if (widget.trailingIcon != null) ...[
                  Icon(
                    widget.trailingIcon,
                    color: color,
                    size: iconSize,
                  ),
                ],
              ],
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
    if (widget.onAsyncTap != null) {
      widget.onAsyncTap?.call();
    } else if (widget.onTap != null) {
      widget.onTap?.call();
    }
  }
}
