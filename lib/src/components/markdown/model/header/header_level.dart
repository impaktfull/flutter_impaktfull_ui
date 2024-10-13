enum ImpaktfullUiMarkDownHeaderLevel {
  h1(amountOfHashtags: 1),
  h2(amountOfHashtags: 2),
  h3(amountOfHashtags: 3),
  h4(amountOfHashtags: 4),
  h5(amountOfHashtags: 5),
  h6(amountOfHashtags: 6);

  final int amountOfHashtags;

  const ImpaktfullUiMarkDownHeaderLevel({
    required this.amountOfHashtags,
  });

  static ImpaktfullUiMarkDownHeaderLevel parse(int amountOfHashtags) {
    if (amountOfHashtags == 0 || amountOfHashtags > 6) {
      throw ArgumentError('Invalid amount of hashtags (between 1 and 6)');
    }
    return values
        .firstWhere((item) => item.amountOfHashtags == amountOfHashtags);
  }
}
