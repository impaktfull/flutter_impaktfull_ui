import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/spacing_theme.dart';

class ImpaktfullUiDimensTheme {
  final BorderRadiusGeometry borderRadiusExtraSmall;
  final BorderRadiusGeometry borderRadiusSmall;
  final BorderRadiusGeometry borderRadius;
  final BorderRadiusGeometry borderRadiusLarge;
  final BorderRadiusGeometry borderRadiusExtraLarge;
  final BorderRadiusGeometry borderRadiusCircle;

  /// The spacing scale of the theme.
  ///
  /// Optional, so a theme that was built before it existed keeps compiling. It
  /// becomes `required` in 1.0.0; until then it defaults to the 4 / 8 / 12 /
  /// 16 / 24 / 32 scale of [ImpaktfullUiSpacingTheme.getDefault].
  final ImpaktfullUiSpacingTheme spacing;

  const ImpaktfullUiDimensTheme({
    required this.borderRadiusExtraSmall,
    required this.borderRadiusSmall,
    required this.borderRadius,
    required this.borderRadiusLarge,
    required this.borderRadiusExtraLarge,
    required this.borderRadiusCircle,
    this.spacing = const ImpaktfullUiSpacingTheme(
      extraSmall: 4,
      small: 8,
      medium: 12,
      large: 16,
      extraLarge: 24,
      extraLarge2: 32,
    ),
  });

  /// The border radius scale grown from one [radius] seed, plus the spacing
  /// scale grown from one [spacingUnit].
  ///
  /// [radius] is the radius of a control (a button, an input field, a badge, a
  /// table, ...): it is what `borderRadius` becomes, and almost every radius
  /// of the package reads that one. The rest of the scale follows it the way
  /// Tailwind derives its radii from `--radius`, clamped at 0:
  ///
  /// | token | value | default (`radius: 8`) |
  /// |---|---|---|
  /// | `borderRadiusExtraSmall` | `radius - 4` | 4 |
  /// | `borderRadiusSmall` | `radius - 2` | 6 |
  /// | `borderRadius` | `radius` | 8 |
  /// | `borderRadiusLarge` | `radius + 4` | 12 |
  /// | `borderRadiusExtraLarge` | `radius + 8` | 16 |
  ///
  /// So `getDefault(radius: 6)` is Ant Design's scale and
  /// `getDefault(radius: 10)` is shadcn/ui's, in one value. Every step stays
  /// overridable: a step that is passed wins over the seed.
  static ImpaktfullUiDimensTheme getDefault({
    double radius = 8,
    BorderRadiusGeometry? borderRadiusExtraSmall,
    BorderRadiusGeometry? borderRadiusSmall,
    BorderRadiusGeometry? borderRadius,
    BorderRadiusGeometry? borderRadiusLarge,
    BorderRadiusGeometry? borderRadiusExtraLarge,
    BorderRadiusGeometry? borderRadiusCircle,
    double spacingUnit = 4,
    ImpaktfullUiSpacingTheme? spacing,
  }) =>
      ImpaktfullUiDimensTheme(
        borderRadiusExtraSmall:
            borderRadiusExtraSmall ?? BorderRadius.circular(max(0, radius - 4)),
        borderRadiusSmall:
            borderRadiusSmall ?? BorderRadius.circular(max(0, radius - 2)),
        borderRadius: borderRadius ?? BorderRadius.circular(max(0, radius)),
        borderRadiusLarge:
            borderRadiusLarge ?? BorderRadius.circular(max(0, radius + 4)),
        borderRadiusExtraLarge:
            borderRadiusExtraLarge ?? BorderRadius.circular(max(0, radius + 8)),
        // A pill: bigger than half the shortest side of anything this package
        // renders, so Flutter clamps it to a half circle. Not a bigger value:
        // an `InkWell` with an absurd radius makes a software-rendered frame
        // take minutes.
        borderRadiusCircle:
            borderRadiusCircle ?? BorderRadius.circular(borderRadiusCircleMax),
        spacing:
            spacing ?? ImpaktfullUiSpacingTheme.getDefault(unit: spacingUnit),
      );

  /// The radius of [borderRadiusCircle], and the biggest radius a theme of
  /// this package uses.
  ///
  /// Flutter clamps a border radius to half the shortest side of the box it
  /// paints, so any value above that renders as a half circle. A value far
  /// above it does not: `Path.addRRect` with a huge radius is slow enough to
  /// make a software-rendered frame take minutes.
  static const double borderRadiusCircleMax = 999;

  ImpaktfullUiDimensTheme copyWith({
    BorderRadiusGeometry? borderRadiusExtraSmall,
    BorderRadiusGeometry? borderRadiusSmall,
    BorderRadiusGeometry? borderRadius,
    BorderRadiusGeometry? borderRadiusLarge,
    BorderRadiusGeometry? borderRadiusExtraLarge,
    BorderRadiusGeometry? borderRadiusCircle,
    ImpaktfullUiSpacingTheme? spacing,
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
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDimensTheme &&
          borderRadiusExtraSmall == other.borderRadiusExtraSmall &&
          borderRadiusSmall == other.borderRadiusSmall &&
          borderRadius == other.borderRadius &&
          borderRadiusLarge == other.borderRadiusLarge &&
          borderRadiusExtraLarge == other.borderRadiusExtraLarge &&
          borderRadiusCircle == other.borderRadiusCircle &&
          spacing == other.spacing;

  @override
  int get hashCode => Object.hash(
      borderRadiusExtraSmall,
      borderRadiusSmall,
      borderRadius,
      borderRadiusLarge,
      borderRadiusExtraLarge,
      borderRadiusCircle,
      spacing);
}
