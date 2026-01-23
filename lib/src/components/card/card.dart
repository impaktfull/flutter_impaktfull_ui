import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/card/card_style.dart';
import 'package:impaktfull_ui/src/components/container/container.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'card_style.dart';

class ImpaktfullUiCard extends StatefulWidget {
  final Widget child;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final MouseCursor cursor;
  final VoidCallback? onFocus;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? shadow;
  final bool error;
  final AlignmentGeometry? alignment;
  final ImpaktfullUiCardTheme? theme;

  const ImpaktfullUiCard({
    required this.child,
    this.width,
    this.height,
    this.cursor = MouseCursor.defer,
    this.onTap,
    this.onFocus,
    this.padding,
    this.borderRadius,
    this.shadow,
    this.error = false,
    this.alignment,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiCard> createState() => _ImpaktfullUiCardState();
}

class _ImpaktfullUiCardState extends State<ImpaktfullUiCard> {
  @override
  Widget build(BuildContext context) {
    final onTapEnabled = widget.onTap != null;
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiContainer(
        width: widget.width,
        height: widget.height,
        borderRadius: widget.borderRadius ?? componentTheme.dimens.borderRadius,
        color: componentTheme.colors.background,
        border: _getBorder(componentTheme),
        shadow: widget.shadow ?? componentTheme.shadows.card,
        child: ImpaktfullUiTouchFeedback(
          canRequestFocus: onTapEnabled,
          useFocusColor: onTapEnabled,
          cursor: onTapEnabled && widget.cursor == MouseCursor.defer
              ? SystemMouseCursors.click
              : widget.cursor,
          onTap: widget.onTap,
          onFocus: widget.onFocus,
          borderRadius:
              widget.borderRadius ?? componentTheme.dimens.borderRadius,
          child: ClipRRect(
            borderRadius: componentTheme.dimens.borderRadius,
            child: Padding(
              padding: widget.padding ?? componentTheme.dimens.padding,
              child: Builder(builder: (context) {
                if (widget.alignment == null) {
                  return widget.child;
                }
                return Align(
                  alignment: widget.alignment!,
                  child: widget.child,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  BoxBorder? _getBorder(ImpaktfullUiCardTheme componentTheme) {
    if (widget.error && componentTheme.colors.borderError != null) {
      return Border.all(
        color: componentTheme.colors.borderError!,
        strokeAlign: BorderSide.strokeAlignOutside,
        width: componentTheme.dimens.borderWidth,
      );
    }
    if (componentTheme.colors.border != null) {
      return Border.all(
        color: widget.error
            ? componentTheme.colors.borderError!
            : componentTheme.colors.border!,
        strokeAlign: BorderSide.strokeAlignOutside,
        width: componentTheme.dimens.borderWidth,
      );
    }
    return null;
  }
}
