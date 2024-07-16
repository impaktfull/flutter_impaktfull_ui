enum ImpaktfullUiButtonSize {
  extraSmall(horizontalPadding: 12, verticalPadding: 8),
  small(horizontalPadding: 14, verticalPadding: 10),
  medium(horizontalPadding: 16, verticalPadding: 12),
  large(horizontalPadding: 18, verticalPadding: 14),
  extraLarge(horizontalPadding: 20, verticalPadding: 16);

  final double horizontalPadding;
  final double verticalPadding;

  const ImpaktfullUiButtonSize({
    required this.horizontalPadding,
    required this.verticalPadding,
  });
}
