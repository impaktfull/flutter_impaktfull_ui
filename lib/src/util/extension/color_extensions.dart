import 'dart:ui';

extension ColorExtension on Color {
  Color withOpacityPercentage(double percentage) =>
      withAlpha((255.0 * percentage).round());
}
