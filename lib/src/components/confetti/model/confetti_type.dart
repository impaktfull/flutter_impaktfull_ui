import 'dart:math';

enum ImpaktfullUiConfettiType {
  circle(aspectRatio: 1 / 1),
  square(aspectRatio: 1 / 1),
  rectangle(aspectRatio: 2 / 1),
  roundedSquare(aspectRatio: 2 / 1),
  roundedRectangle(aspectRatio: 2 / 1),
  snow(aspectRatio: 1 / 1),
  leaf(aspectRatio: 2 / 1);

  final double aspectRatio;

  static ImpaktfullUiConfettiType random(
      List<ImpaktfullUiConfettiType> excludedTypes) {
    var types = ImpaktfullUiConfettiType.values
        .where((type) => !excludedTypes.contains(type))
        .toList();
    return types[Random().nextInt(types.length)];
  }

  const ImpaktfullUiConfettiType({
    required this.aspectRatio,
  });
}
