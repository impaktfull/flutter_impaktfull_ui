import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

void main() {
  const style = TextStyle(
    fontSize: 14,
    fontFamily: 'Geologica',
    color: Color(0xFF123456),
  );

  test('font weight getters only change the font weight', () {
    expect(style.light, style.copyWith(fontWeight: FontWeight.w300));
    expect(style.medium, style.copyWith(fontWeight: FontWeight.w500));
    expect(style.semiBold, style.copyWith(fontWeight: FontWeight.w600));
    expect(style.bold, style.copyWith(fontWeight: FontWeight.w700));
  });

  test('withOpacity sets the alpha of the color', () {
    final result = style.withOpacity(0.5);
    expect(result.color, const Color(0x80123456));
    expect(result.fontSize, 14);
    expect(result.fontFamily, 'Geologica');
  });

  test('withOpacity without a color keeps the color null', () {
    const noColor = TextStyle(fontSize: 12);
    expect(noColor.withOpacity(0.5).color, isNull);
  });
}
