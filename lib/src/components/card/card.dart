import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

export 'card_style.dart';

class ImpaktfullUiCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final ImpaktfullUiCardTheme? theme;

  const ImpaktfullUiCard({
    required this.child,
    this.onTap,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiCard> createState() => _ImpaktfullUiCardState();
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
          onTap: widget.onTap,
          borderRadius: componentTheme.dimens.borderRadius,
          child: Padding(
            padding: componentTheme.dimens.padding,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
