import 'package:flutter/material.dart';

class ImpaktfullUiDimensTheme {
  final BorderRadius borderRadiusExtraSmall;
  final BorderRadius borderRadiusSmall;
  final BorderRadius borderRadius;
  final BorderRadius borderRadiusLarge;
  final BorderRadius borderRadiusExtraLarge;
  final BorderRadius borderRadiusCircle;

  const ImpaktfullUiDimensTheme({
    required this.borderRadiusExtraSmall,
    required this.borderRadiusSmall,
    required this.borderRadius,
    required this.borderRadiusLarge,
    required this.borderRadiusExtraLarge,
    required this.borderRadiusCircle,
  });

  ImpaktfullUiDimensTheme copyWith({
    BorderRadius? borderRadiusExtraSmall,
    BorderRadius? borderRadiusSmall,
    BorderRadius? borderRadius,
    BorderRadius? borderRadiusLarge,
    BorderRadius? borderRadiusExtraLarge,
    BorderRadius? borderRadiusCircle,
  }) =>
      ImpaktfullUiDimensTheme(
        borderRadiusExtraSmall:
            borderRadiusExtraSmall ?? this.borderRadiusExtraSmall,
        borderRadiusSmall: borderRadiusSmall ?? this.borderRadiusSmall,
        borderRadius: borderRadius ?? this.borderRadius,
        borderRadiusLarge: borderRadiusLarge ?? this.borderRadiusLarge,
        borderRadiusExtraLarge:
            borderRadiusExtraLarge ?? this.borderRadiusExtraLarge,
        borderRadiusCircle: borderRadiusCircle ?? this.borderRadiusCircle,
      );
}
