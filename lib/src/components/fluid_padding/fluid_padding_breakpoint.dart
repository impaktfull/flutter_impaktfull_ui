import 'dart:ui';

class ImpaktfullUiFluidPaddingBreakPoint {
  final String? label;
  final double? minWidth;
  final double? maxWidth;
  final double? padding;
  final double? paddingMin;
  final double? paddingMax;

  const ImpaktfullUiFluidPaddingBreakPoint({
    this.label,
    this.minWidth,
    this.maxWidth,
    this.padding,
    this.paddingMin,
    this.paddingMax,
  });

  double? getPadding(double width) {
    if (padding != null) return padding;
    final minWidth = this.minWidth;
    final maxWidth = this.maxWidth;
    final min = paddingMin;
    final max = paddingMax;
    if (min == null && max == null) return null;
    if (min == null) return max;
    if (max == null) return min;
    if (minWidth == null || maxWidth == null) return min;
    final percentage = (width - minWidth) / (maxWidth - minWidth);
    final value = lerpDouble(min, max, percentage.clamp(0.0, 1.0));
    return value;
  }

  bool matchesWidth(double width) {
    final minWidth = this.minWidth;
    final maxWidth = this.maxWidth;
    if (minWidth != null && maxWidth != null) {
      return width >= minWidth && width < maxWidth;
    }
    if (maxWidth != null) {
      return width < maxWidth;
    }
    if (minWidth != null) {
      return width >= minWidth;
    }
    return false;
  }
}
