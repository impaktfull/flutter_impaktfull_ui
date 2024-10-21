import 'package:flutter/rendering.dart';

extension TextStyleExtension on TextStyle {
  TextStyle withOpacity(double opacity) => copyWith(
        color: color?.withOpacity(opacity),
      );
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
}
