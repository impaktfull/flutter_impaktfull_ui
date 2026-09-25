import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/components/slider/model/slider_legend_alignment.dart';
import 'package:impaktfull_ui/src/components/slider/slider_style.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';
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

  /// What screen readers announce for the slider, e.g. `Volume`.
  final String? semanticLabel;

  /// Formats the value for screen readers, e.g. `12 kg`. Defaults to the
  /// number in the locale of the app.
  final String Function(double value)? semanticFormatterCallback;

  /// How much the arrow keys and the increase and decrease actions of screen
  /// readers change the value. Defaults to a tenth of the range.
  final double? step;

  const ImpaktfullUiSlider({
    required this.value,
    required this.min,
    required this.max,
    this.onChanged,
    this.semanticLabel,
    this.semanticFormatterCallback,
    this.step,
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
      builder: (context, componentTheme) {
        // The ring the rest of the package uses, so a theme that changes it
        // changes the ring of the slider too.
        final focusRing = ImpaktfullUiTouchFeedbackTheme.of(context).focusRing;
        return Semantics(
          container: true,
          slider: true,
          label: widget.semanticLabel,
          enabled: _isEnabled,
          value: _formatValue(_currentValue),
          increasedValue: _formatValue(_steppedValue(1)),
          decreasedValue: _formatValue(_steppedValue(-1)),
          onIncrease: _isEnabled ? () => _step(1) : null,
          onDecrease: _isEnabled ? () => _step(-1) : null,
          child: Focus(
            focusNode: _focusNode,
            canRequestFocus: _isEnabled,
            onKeyEvent: _onKeyEvent,
            onFocusChange: (_) => setState(() {}),
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
                        PositionedDirectional(
                          top: 0,
                          start: 0,
                          end: 0,
                          child: SizedBox(
                            height: componentTheme.dimens.legendHeight,
                            child:
                                widget.legendBuilder!(context, _currentValue),
                          ),
                        ),
                      ] else if (widget.legendAlignment ==
                          ImpaktfullUiSliderLegendAlignment.belowSlider) ...[
                        PositionedDirectional(
                          bottom: 0,
                          start: 0,
                          end: 0,
                          child: SizedBox(
                            height: componentTheme.dimens.legendHeight,
                            child:
                                widget.legendBuilder!(context, _currentValue),
                          ),
                        ),
                      ] else if (widget.legendAlignment ==
                          ImpaktfullUiSliderLegendAlignment.behindSlider) ...[
                        PositionedDirectional(
                          top: 0,
                          bottom: 0,
                          start: 0,
                          end: 0,
                          child: SizedBox(
                            height: componentTheme.dimens.height,
                            child:
                                widget.legendBuilder!(context, _currentValue),
                          ),
                        ),
                      ],
                    ],
                    Container(
                      height: componentTheme.dimens.height,
                      color: Colors.transparent,
                      // The focus ring, only while navigating with a keyboard.
                      foregroundDecoration: _showFocus
                          ? BoxDecoration(
                              borderRadius:
                                  componentTheme.dimens.trackBorderRadius,
                              border: Border.all(
                                color: focusRing.color ??
                                    ImpaktfullUiTheme.of(context)
                                        .colors
                                        .accent
                                        .withOpacityPercentage(0.66),
                                width: focusRing.width,
                              ),
                            )
                          : null,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          Container(
                            height: componentTheme.dimens.trackHeight,
                            decoration: BoxDecoration(
                              color: componentTheme.colors.track,
                              borderRadius:
                                  componentTheme.dimens.trackBorderRadius,
                              border: Border.all(
                                color: componentTheme.colors.trackBorder,
                                width: componentTheme.dimens.trackBorderWidth,
                                strokeAlign: BorderSide.strokeAlignOutside,
                              ),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: _fraction,
                            child: Container(
                              height: componentTheme.dimens.trackHeight,
                              decoration: BoxDecoration(
                                color: componentTheme.colors.activeTrack,
                                border: Border.all(
                                  color: componentTheme.colors.activeTrack,
                                  width: componentTheme.dimens.trackBorderWidth,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                                borderRadius:
                                    componentTheme.dimens.trackBorderRadius,
                              ),
                            ),
                          ),
                          PositionedDirectional(
                            start: _fraction * constraints.maxWidth -
                                componentTheme.dimens.thumbSize / 2,
                            child: Container(
                              width: componentTheme.dimens.thumbSize,
                              height: componentTheme.dimens.thumbSize,
                              decoration: BoxDecoration(
                                color: componentTheme.colors.thumb,
                                borderRadius:
                                    componentTheme.dimens.thumbBorderRadius,
                                border: Border.all(
                                  color: componentTheme.colors.thumbBorder,
                                  width: componentTheme.dimens.thumbBorderWidth,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Colors.black.withOpacityPercentage(0.1),
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
      },
    );
  }

  bool get _isEnabled => widget.onChanged != null;

  /// Only show the focus ring when navigating with a keyboard.
  bool get _showFocus =>
      _focusNode.hasFocus &&
      FocusManager.instance.highlightMode == FocusHighlightMode.traditional;

  double get _stepSize {
    final step = widget.step;
    if (step != null && step > 0) return step;
    return (widget.max - widget.min) / 10;
  }

  double _steppedValue(int direction) {
    if (widget.max <= widget.min) return widget.min;
    return (_currentValue + _stepSize * direction)
        .clamp(widget.min, widget.max)
        .toDouble();
  }

  String _formatValue(double value) {
    final formatter = widget.semanticFormatterCallback;
    if (formatter != null) return formatter(value);
    final isWholeNumber = value == value.roundToDouble();
    return ImpaktfullUiLocaleUtil.formatDecimal(
      context,
      value,
      fractionDigits: isWholeNumber ? 0 : 2,
    );
  }

  void _step(int direction) => _setValue(_steppedValue(direction));

  void _setValue(double value) {
    if (!_isEnabled || value == _currentValue) return;
    setState(() => _currentValue = value);
    widget.onChanged?.call(_currentValue);
  }

  /// The arrow keys change the value by [_stepSize], home and end go to the
  /// minimum and maximum. Left and right follow the reading direction: in a
  /// right-to-left layout the minimum is on the right.
  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    if (!_isEnabled) return KeyEventResult.ignored;
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final key = event.logicalKey;
    if (key == LogicalKeyboardKey.arrowUp) {
      _step(1);
    } else if (key == LogicalKeyboardKey.arrowDown) {
      _step(-1);
    } else if (key == LogicalKeyboardKey.arrowRight) {
      _step(isRtl ? -1 : 1);
    } else if (key == LogicalKeyboardKey.arrowLeft) {
      _step(isRtl ? 1 : -1);
    } else if (key == LogicalKeyboardKey.home) {
      _setValue(widget.min);
    } else if (key == LogicalKeyboardKey.end) {
      _setValue(widget.max);
    } else {
      return KeyEventResult.ignored;
    }
    return KeyEventResult.handled;
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
    // In right-to-left layouts the minimum value is on the right.
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final percent = isRtl ? (width - localX) / width : localX / width;
    final newValue = min + (max - min) * percent;

    setState(() => _currentValue = newValue.clamp(min, max));
    widget.onChanged?.call(_currentValue);
  }
}
