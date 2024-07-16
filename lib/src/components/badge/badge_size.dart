enum ImpaktfullUiBadgeSize {
  small(horizontalPadding: 8, verticalPadding: 2, paddingOffset: 0, spacing: 4, widgetSize: 16),
  medium(horizontalPadding: 10, verticalPadding: 2, paddingOffset: 1, spacing: 6, widgetSize: 18),
  large(horizontalPadding: 12, verticalPadding: 4, paddingOffset: 2, spacing: 6, widgetSize: 24);

  final double horizontalPadding;
  final double verticalPadding;
  final double paddingOffset;
  final double spacing;
  final double widgetSize;

  const ImpaktfullUiBadgeSize({
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.paddingOffset,
    required this.spacing,
    required this.widgetSize,
  });
}
