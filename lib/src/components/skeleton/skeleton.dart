import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/skeleton/skeleton_style.dart';
import 'package:impaktfull_ui/src/util/animation/animation_util.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'skeleton_style.dart';

class ImpaktfullUiSkeleton extends StatefulWidget {
  final double? height;
  final double? width;
  final double? widthFactor;
  final double? heightFactor;
  final BorderRadiusGeometry? borderRadius;
  final ImpaktfullUiSkeletonTheme? theme;

  const ImpaktfullUiSkeleton.box({
    required double this.width,
    required double this.height,
    this.borderRadius,
    this.theme,
    super.key,
  })  : heightFactor = null,
        widthFactor = null;
  const ImpaktfullUiSkeleton.circle({
    required double this.width,
    required double this.height,
    this.theme,
    super.key,
  })  : heightFactor = null,
        widthFactor = null,
        borderRadius = const BorderRadius.all(Radius.circular(99999));

  const ImpaktfullUiSkeleton.factor({
    double this.widthFactor = 1,
    double this.heightFactor = 1,
    this.width,
    this.height,
    this.borderRadius,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiSkeleton> createState() => _ImpaktfullUiSkeletonState();
}

class _ImpaktfullUiSkeletonState extends State<ImpaktfullUiSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // The duration comes from the theme in `didChangeDependencies`, which
    // runs before the first build.
    _controller = AnimationController(vsync: this);
    _animation = Tween<double>(begin: -3, end: 3).animate(_controller);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final componentTheme =
        widget.theme ?? ImpaktfullUiSkeletonTheme.of(context);
    _controller.duration = ImpaktfullUiAnimationUtil.duration(
      context,
      componentTheme.durations.shimmer,
    );
    // No shimmer when the user asked to reduce motion.
    if (ImpaktfullUiAnimationUtil.reduceMotion(context)) {
      _controller.stop();
    } else if (!_controller.isAnimating) {
      _controller.repeat();
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
      // A placeholder for content that is loading: the loading state is
      // announced by the screen that shows it, not by every skeleton.
      builder: (context, componentTheme) => ExcludeSemantics(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              AnimatedBuilder(
            animation: _animation,
            builder: (context, child) => Container(
              width: widget.width ??
                  (widget.widthFactor != null
                      ? constraints.maxWidth * widget.widthFactor!
                      : null),
              height: widget.height ??
                  (widget.heightFactor != null
                      ? constraints.maxHeight * widget.heightFactor!
                      : null),
              decoration: BoxDecoration(
                color: componentTheme.colors.background,
                borderRadius:
                    widget.borderRadius ?? componentTheme.dimens.borderRadius,
              ),
              child: ClipRRect(
                borderRadius:
                    widget.borderRadius ?? componentTheme.dimens.borderRadius,
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  alignment: AlignmentDirectional(_animation.value, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          componentTheme.colors.highlight
                              .withOpacityPercentage(0.0),
                          componentTheme.colors.highlight,
                          componentTheme.colors.highlight
                              .withOpacityPercentage(0.0),
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
