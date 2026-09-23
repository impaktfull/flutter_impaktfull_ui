import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/util/animation/animation_util.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/floating_action_button/floating_action_button_style.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'floating_action_button_style.dart';

class ImpaktfullUiFloatingActionButton extends StatefulWidget {
  final ImpaktfullUiAsset asset;
  final String? title;
  final bool expanded;
  final VoidCallback? onTap;
  final ImpaktfullUiFloatingActionButtonTheme? theme;

  const ImpaktfullUiFloatingActionButton({
    required this.asset,
    String? title,
    @Deprecated('Use title instead. Will be removed in 1.0.0.') String? label,
    this.onTap,
    bool expanded = false,
    this.theme,
    super.key,
  })  : title = title ?? label,
        expanded = (title ?? label) == null ? false : expanded;

  @Deprecated('Use title instead. Will be removed in 1.0.0.')
  String? get label => title;

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
    // The duration comes from the theme in `didChangeDependencies`, which
    // runs before the first build.
    _controller = AnimationController(vsync: this);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    if (widget.expanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final componentTheme =
        widget.theme ?? ImpaktfullUiFloatingActionButtonTheme.of(context);
    _controller.duration = ImpaktfullUiAnimationUtil.duration(
        context, componentTheme.durations.expand);
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
        tooltip: widget.title,
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
              if (widget.title != null) ...[
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return ClipRect(
                      child: SizedBox(
                        width: _animation.value *
                            getSize(
                              widget.title!,
                              componentTheme.textStyles.label,
                            ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 12,
                            end: 8,
                          ),
                          child: Text(
                            widget.title!,
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

  /// The width of the label, including its padding.
  ///
  /// The label is measured like the [Text] widget renders it (with the
  /// [DefaultTextStyle] and the text scaler), otherwise the expanded label is
  /// clipped.
  double getSize(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: DefaultTextStyle.of(context).style.merge(style),
      ),
      maxLines: 1,
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
    );
    textPainter.layout(maxWidth: double.infinity);
    final width = textPainter.width.ceilToDouble();
    textPainter.dispose();
    return 12 + width + 8;
  }
}
