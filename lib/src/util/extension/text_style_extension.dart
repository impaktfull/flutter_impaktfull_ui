import 'package:flutter/rendering.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';

extension TextStyleExtension on TextStyle {
  TextStyle withOpacity(double opacity) => copyWith(
        color: color?.withOpacityPercentage(opacity),
      );
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
}
