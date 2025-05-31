import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/skeleton/skeleton_style.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component.dart';

export 'skeleton_style.dart';

part 'skeleton.describe.dart';

class ImpaktfullUiSkeleton extends StatefulWidget
    with ComponentDescriptorMixin {
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

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiSkeletonState extends State<ImpaktfullUiSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _animation = Tween<double>(begin: -3, end: 3).animate(_controller);
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
      builder: (context, componentTheme) => LayoutBuilder(
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
                alignment: Alignment(_animation.value, 0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        componentTheme.colors.background
                            .withOpacityPercentage(0.0),
                        componentTheme.colors.background
                            .withOpacityPercentage(0.2),
                        componentTheme.colors.background
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
    );
  }
}
