import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/card/card_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'card_style.dart';

part 'card.describe.dart';

class ImpaktfullUiCard extends StatefulWidget with ComponentDescriptorMixin {
  final Widget child;
  final VoidCallback? onTap;
  final MouseCursor cursor;
  final VoidCallback? onFocus;
  final EdgeInsets? padding;
  final ImpaktfullUiCardTheme? theme;

  const ImpaktfullUiCard({
    required this.child,
    this.cursor = MouseCursor.defer,
    this.onTap,
    this.onFocus,
    this.padding,
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
      builder: (context, theme, componentTheme) => Container(
        decoration: BoxDecoration(
          borderRadius: componentTheme.dimens.borderRadius,
          color: componentTheme.colors.background,
          border: componentTheme.colors.border == null
              ? null
              : Border.all(
                  color: componentTheme.colors.border!,
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 1,
                ),
          boxShadow: [
            if (componentTheme.colors.shadow != null) ...[
              BoxShadow(
                color: componentTheme.colors.shadow!,
              ),
            ]
          ],
        ),
        child: ImpaktfullUiTouchFeedback(
          canRequestFocus: false,
          cursor: widget.onTap != null && widget.cursor == MouseCursor.defer
              ? SystemMouseCursors.click
              : widget.cursor,
          onTap: widget.onTap,
          onFocus: widget.onFocus,
          borderRadius: componentTheme.dimens.borderRadius,
          child: Padding(
            padding: widget.padding ?? componentTheme.dimens.padding,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
