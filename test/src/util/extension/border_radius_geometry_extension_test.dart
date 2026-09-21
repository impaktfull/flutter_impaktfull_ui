import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  const radius = Radius.circular(8);
  // Typed like the theme's `borderRadius` fields: `BorderRadius` has its own
  // copyWith(topLeft: ...) that would hide the extension.
  final BorderRadiusGeometry physical = BorderRadius.circular(8);

  group('BorderRadiusGeometryExtension.copyWith', () {
    test('keeps a left-to-right layout identical for a physical radius', () {
      final result = physical.copyWith(topEnd: Radius.zero);
      expect(
        result.resolve(TextDirection.ltr),
        const BorderRadius.only(
          topLeft: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
      );
    });

    test('mirrors the start and end corners in a right-to-left layout', () {
      final result = physical.copyWith(
        topEnd: Radius.zero,
        bottomEnd: Radius.zero,
      );
      expect(
        result.resolve(TextDirection.rtl),
        const BorderRadius.only(topRight: radius, bottomRight: radius),
      );
    });

    test('keeps a directional radius directional', () {
      final result = const BorderRadiusDirectional.all(radius)
          .copyWith(bottomStart: Radius.zero);
      expect(result, isA<BorderRadiusDirectional>());
      expect(
        result.resolve(TextDirection.rtl),
        const BorderRadius.only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
        ),
      );
    });
  });
}
