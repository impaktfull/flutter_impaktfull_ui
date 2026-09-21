import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';

void main() {
  group('withOpacityPercentage', () {
    test('sets the alpha and keeps the rgb', () {
      const color = Color(0xFF123456);
      expect(color.withOpacityPercentage(0), const Color(0x00123456));
      expect(color.withOpacityPercentage(0.5), const Color(0x80123456));
      expect(color.withOpacityPercentage(1), const Color(0xFF123456));
    });

    test('replaces the alpha instead of multiplying it', () {
      const color = Color(0x10123456);
      expect(color.withOpacityPercentage(1).a, 1);
    });
  });

  group('toHexString', () {
    test('returns #RRGGBB in upper case', () {
      expect(const Color(0xFF7d64f2).toHexString(), '#7D64F2');
      expect(const Color(0xFF000000).toHexString(), '#000000');
      expect(const Color(0xFFFFFFFF).toHexString(), '#FFFFFF');
    });

    test('ignores the alpha by default', () {
      expect(const Color(0x00102030).toHexString(), '#102030');
    });

    test('appends the alpha when includeAlpha is true', () {
      expect(
          const Color(0x80102030).toHexString(includeAlpha: true), '#10203080');
      expect(
          const Color(0xFF102030).toHexString(includeAlpha: true), '#102030FF');
      expect(
          const Color(0x00102030).toHexString(includeAlpha: true), '#10203000');
    });
  });
}
