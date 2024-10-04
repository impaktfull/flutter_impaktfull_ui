import 'package:flutter/material.dart';

class ImpaktfullUiDimensTheme {
  final BorderRadiusGeometry borderRadiusExtraSmall;
  final BorderRadiusGeometry borderRadiusSmall;
  final BorderRadiusGeometry borderRadius;
  final BorderRadiusGeometry borderRadiusLarge;
  final BorderRadiusGeometry borderRadiusExtraLarge;
  final BorderRadiusGeometry borderRadiusCircle;

  const ImpaktfullUiDimensTheme({
    required this.borderRadiusExtraSmall,
    required this.borderRadiusSmall,
    required this.borderRadius,
    required this.borderRadiusLarge,
    required this.borderRadiusExtraLarge,
    required this.borderRadiusCircle,
  });

  ImpaktfullUiDimensTheme copyWith({
    BorderRadiusGeometry? borderRadiusExtraSmall,
    BorderRadiusGeometry? borderRadiusSmall,
    BorderRadiusGeometry? borderRadius,
    BorderRadiusGeometry? borderRadiusLarge,
    BorderRadiusGeometry? borderRadiusExtraLarge,
    BorderRadiusGeometry? borderRadiusCircle,
  }) =>
      ImpaktfullUiDimensTheme(
        borderRadiusExtraSmall: borderRadiusExtraSmall ?? this.borderRadiusExtraSmall,
        borderRadiusSmall: borderRadiusSmall ?? this.borderRadiusSmall,
        borderRadius: borderRadius ?? this.borderRadius,
        borderRadiusLarge: borderRadiusLarge ?? this.borderRadiusLarge,
        borderRadiusExtraLarge: borderRadiusExtraLarge ?? this.borderRadiusExtraLarge,
        borderRadiusCircle: borderRadiusCircle ?? this.borderRadiusCircle,
      );
}
