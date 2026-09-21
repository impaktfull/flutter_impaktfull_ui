import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/util/extension/border_radius_geometry_extension.dart';
import 'package:impaktfull_ui/src/util/extension/edge_insets_geometry_extension.dart';

void main() {
  group('EdgeInsetsGeometryExtension', () {
    test('reads EdgeInsets as left to right', () {
      const EdgeInsetsGeometry insets =
          EdgeInsets.fromLTRB(1, 2, 3, 4); // left, top, right, bottom
      expect(insets.start, 1);
      expect(insets.top, 2);
      expect(insets.end, 3);
      expect(insets.bottom, 4);
    });

    test('reads EdgeInsetsDirectional', () {
      const EdgeInsetsGeometry insets =
          EdgeInsetsDirectional.fromSTEB(1, 2, 3, 4);
      expect(insets.start, 1);
      expect(insets.top, 2);
      expect(insets.end, 3);
      expect(insets.bottom, 4);
    });
  });

  group('BorderRadiusGeometryExtension', () {
    const a = Radius.circular(1);
    const b = Radius.circular(2);
    const c = Radius.circular(3);
    const d = Radius.circular(4);
    const e = Radius.circular(9);

    test('reads BorderRadius as left to right', () {
      const BorderRadiusGeometry radius = BorderRadius.only(
        topLeft: a,
        topRight: b,
        bottomLeft: c,
        bottomRight: d,
      );
      expect(radius.topStart, a);
      expect(radius.topEnd, b);
      expect(radius.bottomStart, c);
      expect(radius.bottomEnd, d);
      expect(radius.value, same(radius));
    });

    test('reads BorderRadiusDirectional', () {
      const BorderRadiusGeometry radius = BorderRadiusDirectional.only(
        topStart: a,
        topEnd: b,
        bottomStart: c,
        bottomEnd: d,
      );
      expect(radius.topStart, a);
      expect(radius.topEnd, b);
      expect(radius.bottomStart, c);
      expect(radius.bottomEnd, d);
      expect(
        radius.value,
        const BorderRadius.only(
          topLeft: a,
          topRight: b,
          bottomLeft: c,
          bottomRight: d,
        ),
      );
    });

    // copyWith of a physical BorderRadius (it becomes directional) is tested
    // in border_radius_geometry_extension_test.dart.

    test('copyWith of a BorderRadiusDirectional stays directional', () {
      const BorderRadiusGeometry radius = BorderRadiusDirectional.all(a);
      final result = radius.copyWith(topStart: e, bottomEnd: e);
      expect(
        result,
        const BorderRadiusDirectional.only(
          topStart: e,
          topEnd: a,
          bottomStart: a,
          bottomEnd: e,
        ),
      );
    });

    test('copyWith without values keeps the corners in ltr', () {
      const BorderRadiusGeometry radius = BorderRadius.only(
        topLeft: a,
        topRight: b,
        bottomLeft: c,
        bottomRight: d,
      );
      expect(radius.copyWith().resolve(TextDirection.ltr), radius);
    });
  });
}
