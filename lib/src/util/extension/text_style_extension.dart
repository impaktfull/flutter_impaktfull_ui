import 'package:flutter/rendering.dart';

extension TextStyleExtension on TextStyle {
  TextStyle withOpacity(double opacity) => copyWith(
        color: color?.withOpacity(opacity),
      );
}
