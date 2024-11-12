import 'package:flutter/rendering.dart';

class ImpaktfullUiShadowsTheme {
  final List<BoxShadow> extraSmall;
  final List<BoxShadow> small;
  final List<BoxShadow> medium;
  final List<BoxShadow> large;
  final List<BoxShadow> extraLarge;

  const ImpaktfullUiShadowsTheme({
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
  });

  ImpaktfullUiShadowsTheme copyWith({
    List<BoxShadow>? extraSmall,
    List<BoxShadow>? small,
    List<BoxShadow>? medium,
    List<BoxShadow>? large,
    List<BoxShadow>? extraLarge,
  }) =>
      ImpaktfullUiShadowsTheme(
        extraSmall: extraSmall ?? this.extraSmall,
        small: small ?? this.small,
        medium: medium ?? this.medium,
        large: large ?? this.large,
        extraLarge: extraLarge ?? this.extraLarge,
      );

  static ImpaktfullUiShadowsTheme getDefault({
    required Color shadowBase,
  }) =>
      ImpaktfullUiShadowsTheme(
        extraSmall: [
          BoxShadow(
            color: shadowBase.withOpacity(0.05),
            offset: const Offset(0, 1),
            blurRadius: 2,
          ),
        ],
        small: [
          BoxShadow(
            color: shadowBase.withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 3,
          ),
        ],
        medium: [
          BoxShadow(
            color: shadowBase.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: -2,
          ),
        ],
        large: [
          BoxShadow(
            color: shadowBase.withOpacity(0.08),
            offset: const Offset(0, 12),
            spreadRadius: -4,
            blurRadius: 16,
          ),
        ],
        extraLarge: [
          BoxShadow(
            color: shadowBase.withOpacity(0.08),
            offset: const Offset(0, 20),
            blurRadius: 25,
            spreadRadius: -4,
          ),
        ],
      );
}
