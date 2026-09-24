/// The spacing scale of a theme: the gaps and paddings a layout is built from.
///
/// Every step is a multiple of one unit (4 by default), the way both Tailwind
/// (`--spacing: 0.25rem`) and Ant Design (`sizeUnit: 4`) build theirs, so one
/// value drives the whole rhythm of a design system.
///
/// The components of impaktfull_ui do not read this scale yet: their paddings
/// and gaps live in their own `*DimensTheme`. It is here so a theme (and a
/// component theme that is built from it) has one place to take a gap from
/// instead of a literal.
class ImpaktfullUiSpacingTheme {
  final double extraSmall;
  final double small;
  final double medium;
  final double large;
  final double extraLarge;
  final double extraLarge2;

  const ImpaktfullUiSpacingTheme({
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
    required this.extraLarge2,
  });

  /// The 4 / 8 / 12 / 16 / 24 / 32 scale, or the same steps of another [unit]:
  /// `unit` × 1, 2, 3, 4, 6 and 8.
  static ImpaktfullUiSpacingTheme getDefault({
    double unit = 4,
  }) =>
      ImpaktfullUiSpacingTheme(
        extraSmall: unit,
        small: unit * 2,
        medium: unit * 3,
        large: unit * 4,
        extraLarge: unit * 6,
        extraLarge2: unit * 8,
      );

  ImpaktfullUiSpacingTheme copyWith({
    double? extraSmall,
    double? small,
    double? medium,
    double? large,
    double? extraLarge,
    double? extraLarge2,
  }) =>
      ImpaktfullUiSpacingTheme(
        extraSmall: extraSmall ?? this.extraSmall,
        small: small ?? this.small,
        medium: medium ?? this.medium,
        large: large ?? this.large,
        extraLarge: extraLarge ?? this.extraLarge,
        extraLarge2: extraLarge2 ?? this.extraLarge2,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSpacingTheme &&
          extraSmall == other.extraSmall &&
          small == other.small &&
          medium == other.medium &&
          large == other.large &&
          extraLarge == other.extraLarge &&
          extraLarge2 == other.extraLarge2;

  @override
  int get hashCode =>
      Object.hash(extraSmall, small, medium, large, extraLarge, extraLarge2);
}
