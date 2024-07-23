import 'package:flutter/material.dart';

class ImpaktfullUiDimensTheme {
  final BorderRadius borderRadius;
  final BorderRadius borderRadiusSmall;

  const ImpaktfullUiDimensTheme({
    required this.borderRadius,
    required this.borderRadiusSmall,
  });

  ImpaktfullUiDimensTheme copyWith({
    BorderRadius? borderRadius,
    BorderRadius? borderRadiusSmall,
  }) =>
      ImpaktfullUiDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderRadiusSmall: borderRadiusSmall ?? this.borderRadiusSmall,
      );
}
