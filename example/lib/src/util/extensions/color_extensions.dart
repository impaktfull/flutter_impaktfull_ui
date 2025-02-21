import 'dart:ui';

extension ColorExtension on Color {
  Color withOpacityPercentage(double percentage) =>
      withAlpha((255.0 * percentage).round());

  String getHexColor() {
    final alpha = (a * 255).round() & 0xff;
    final red = (r * 255).round() & 0xff;
    final green = (g * 255).round() & 0xff;
    final blue = (b * 255).round() & 0xff;
    final hexValue = (alpha << 24) | (red << 16) | (green << 8) | blue;
    return '#${hexValue.toRadixString(16).toUpperCase().padLeft(8, '0')}';
  }

  String getHexColorWithoutAlpha() {
    final red = (r * 255).round() & 0xff;
    final green = (g * 255).round() & 0xff;
    final blue = (b * 255).round() & 0xff;
    final hexValue = (red << 16) | (green << 8) | blue;
    return '#${hexValue.toRadixString(16).toUpperCase().padLeft(6, '0')}';
  }
}
