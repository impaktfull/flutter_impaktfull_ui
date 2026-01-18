import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/floating_action_button/floating_action_button_style.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'floating_action_button_style.dart';

class ImpaktfullUiFloatingActionButton extends StatefulWidget {
  final ImpaktfullUiAsset asset;
  final String? label;
  final bool expanded;
  final VoidCallback? onTap;
  final ImpaktfullUiFloatingActionButtonTheme? theme;

  const ImpaktfullUiFloatingActionButton({
    required this.asset,
    this.label,
    this.onTap,
    bool expanded = false,
    this.theme,
    super.key,
  }) : expanded = label == null ? false : expanded;

  @override
  State<ImpaktfullUiFloatingActionButton> createState() =>
      _ImpaktfullUiFloatingActionButtonState();
}

class _ImpaktfullUiFloatingActionButtonState
    extends State<ImpaktfullUiFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    if (widget.expanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(ImpaktfullUiFloatingActionButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expanded != oldWidget.expanded) {
      if (widget.expanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiTouchFeedback(
        onTap: widget.onTap,
        toolTip: widget.label,
        color: widget.onTap == null
            ? componentTheme.colors.backgroundDisabled
            : componentTheme.colors.background,
        borderRadius: componentTheme.dimens.borderRadius,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ImpaktfullUiAutoLayout.horizontal(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ImpaktfullUiAssetWidget(
                asset: widget.asset,
                color: componentTheme.colors.icon,
                size: 24,
              ),
              if (widget.label != null) ...[
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return ClipRect(
                      child: SizedBox(
                        width: _animation.value *
                            getSize(
                                widget.label!, componentTheme.textStyles.label),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 12,
                            end: 8,
                          ),
                          child: Text(
                            widget.label!,
                            style: componentTheme.textStyles.label,
                            overflow: TextOverflow.clip,
                            softWrap: false,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  double getSize(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: double.infinity);
    return 12 + textPainter.width + 8;
  }
}
