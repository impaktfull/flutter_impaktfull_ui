import 'dart:ui';

extension ColorExtension on Color {
  Color withOpacityPercentage(double percentage) =>
      withAlpha((255.0 * percentage).round());

  /// The color as `#RRGGBB`, or `#RRGGBBAA` when [includeAlpha] is true.
  String toHexString({bool includeAlpha = false}) {
    String component(double value) =>
        (value * 255).round().toRadixString(16).padLeft(2, '0').toUpperCase();
    final hex = '#${component(r)}${component(g)}${component(b)}';
    if (!includeAlpha) return hex;
    return '$hex${component(a)}';
  }
}
