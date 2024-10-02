class ImpaktfullUiDurationTheme {
  final Duration short;
  final Duration medium;
  final Duration long;

  const ImpaktfullUiDurationTheme({
    required this.short,
    required this.medium,
    required this.long,
  });

  ImpaktfullUiDurationTheme copyWith({
    Duration? short,
    Duration? medium,
    Duration? long,
  }) =>
      ImpaktfullUiDurationTheme(
        short: short ?? this.short,
        medium: medium ?? this.medium,
        long: long ?? this.long,
      );

  static ImpaktfullUiDurationTheme getDefault() =>
      const ImpaktfullUiDurationTheme(
        short: Duration(milliseconds: 200),
        medium: Duration(milliseconds: 350),
        long: Duration(milliseconds: 500),
      );
}
