import 'package:flutter/material.dart';

class ImpaktfullUiDimensTheme {
  final BorderRadius borderRadiusSmall;
  final BorderRadius borderRadius;
  final BorderRadius borderRadiusLarge;

  const ImpaktfullUiDimensTheme({
    required this.borderRadiusSmall,
    required this.borderRadius,
    required this.borderRadiusLarge,
  });

  ImpaktfullUiDimensTheme copyWith({
    BorderRadius? borderRadius,
    BorderRadius? borderRadiusSmall,
    BorderRadius? borderRadiusLarge,
  }) =>
      ImpaktfullUiDimensTheme(
        borderRadiusSmall: borderRadiusSmall ?? this.borderRadiusSmall,
        borderRadius: borderRadius ?? this.borderRadius,
        borderRadiusLarge: borderRadiusLarge ?? this.borderRadiusLarge,
      );
}
