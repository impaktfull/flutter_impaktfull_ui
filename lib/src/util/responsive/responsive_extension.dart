import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  bool get isLargeScreen => MediaQuery.of(this).size.width > 1200;
}
