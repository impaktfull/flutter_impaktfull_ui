import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/card/card_style.dart';
import 'package:impaktfull_ui_2/src/components/container/container.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'card_style.dart';

part 'card.describe.dart';

class ImpaktfullUiCard extends StatefulWidget with ComponentDescriptorMixin {
  final Widget child;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final MouseCursor cursor;
  final VoidCallback? onFocus;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final bool error;
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
    this.error = false,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiCard> createState() => _ImpaktfullUiCardState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiCardState extends State<ImpaktfullUiCard> {
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCardTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiContainer(
        width: widget.width,
        height: widget.height,
        borderRadius: widget.borderRadius ?? componentTheme.dimens.borderRadius,
        color: componentTheme.colors.background,
        border: _getBorder(componentTheme),
        boxShadow: componentTheme.shadows.card,
        child: ImpaktfullUiTouchFeedback(
          canRequestFocus: false,
          useFocusColor: false,
          cursor: widget.onTap != null && widget.cursor == MouseCursor.defer ? SystemMouseCursors.click : widget.cursor,
          onTap: widget.onTap,
          onFocus: widget.onFocus,
          borderRadius: widget.borderRadius ?? componentTheme.dimens.borderRadius,
          child: ClipRRect(
            borderRadius: componentTheme.dimens.borderRadius,
            child: Padding(
              padding: widget.padding ?? componentTheme.dimens.padding,
              child: widget.child,
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
        width: 1,
      );
    }
    if (componentTheme.colors.border != null) {
      return Border.all(
        color: widget.error ? componentTheme.colors.borderError! : componentTheme.colors.border!,
        strokeAlign: BorderSide.strokeAlignOutside,
        width: 1,
      );
    }
    return null;
  }
}
