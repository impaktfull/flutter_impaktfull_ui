import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/slider/model/slider_legend_alignment.dart';
import 'package:impaktfull_ui/src/components/slider/slider_style.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'slider_style.dart';
export 'model/slider_legend_alignment.dart';

class ImpaktfullUiSlider extends StatefulWidget {
  final ImpaktfullUiSliderTheme? theme;
  final double value;
  final double min;
  final double max;
  final Widget Function(BuildContext context, double value)? legendBuilder;
  final ImpaktfullUiSliderLegendAlignment? legendAlignment;
  final ValueChanged<double>? onChanged;

  const ImpaktfullUiSlider({
    required this.value,
    required this.min,
    required this.max,
    this.onChanged,
    this.legendBuilder,
    this.legendAlignment = ImpaktfullUiSliderLegendAlignment.aboveSlider,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiSlider> createState() => _ImpaktfullUiSliderState();
}

class _ImpaktfullUiSliderState extends State<ImpaktfullUiSlider> {
  late double _currentValue;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value.toDouble();
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _currentValue) {
      _currentValue = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => Focus(
        focusNode: _focusNode,
        child: LayoutBuilder(
          builder: (context, constraints) => GestureDetector(
            onHorizontalDragUpdate: widget.onChanged == null
                ? null
                : (details) => _onUpdateThumb(
                    details.localPosition.dx, constraints.maxWidth),
            onTapDown: widget.onChanged == null
                ? null
                : (details) => _onUpdateThumb(
                    details.localPosition.dx, constraints.maxWidth),
            child: Stack(
              children: [
                if (widget.legendBuilder != null) ...[
                  if (widget.legendAlignment ==
                      ImpaktfullUiSliderLegendAlignment.aboveSlider) ...[
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 24,
                        child: widget.legendBuilder!(context, _currentValue),
                      ),
                    ),
                  ] else if (widget.legendAlignment ==
                      ImpaktfullUiSliderLegendAlignment.belowSlider) ...[
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 24,
                        child: widget.legendBuilder!(context, _currentValue),
                      ),
                    ),
                  ] else if (widget.legendAlignment ==
                      ImpaktfullUiSliderLegendAlignment.behindSlider) ...[
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 48,
                        child: widget.legendBuilder!(context, _currentValue),
                      ),
                    ),
                  ],
                ],
                Container(
                  height: 48,
                  color: Colors.transparent,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: componentTheme.colors.track,
                          borderRadius: componentTheme.dimens.trackBorderRadius,
                          border: Border.all(
                            color: componentTheme.colors.trackBorder,
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: _fraction,
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: componentTheme.colors.activeTrack,
                            border: Border.all(
                              color: componentTheme.colors.activeTrack,
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                            borderRadius:
                                componentTheme.dimens.trackBorderRadius,
                          ),
                        ),
                      ),
                      Positioned(
                        left: _fraction * constraints.maxWidth - 8,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: componentTheme.colors.thumb,
                            borderRadius:
                                componentTheme.dimens.thumbBorderRadius,
                            border: Border.all(
                              color: componentTheme.colors.thumbBorder,
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacityPercentage(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  /// The position of the current value between min (0) and max (1).
  double get _fraction {
    final min = widget.min;
    final max = widget.max;
    if (max <= min) return 0;
    return ((_currentValue - min) / (max - min)).clamp(0.0, 1.0);
  }

  void _onUpdateThumb(double dx, double width) {
    if (widget.onChanged == null) return;
    final min = widget.min.toDouble();
    final max = widget.max.toDouble();
    if (max <= min || width <= 0) return;
    final localX = dx.clamp(0, width);
    final percent = localX / width;
    final newValue = min + (max - min) * percent;

    setState(() => _currentValue = newValue.clamp(min, max));
    widget.onChanged?.call(_currentValue);
  }
}
