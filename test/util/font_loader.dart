import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

Future<void> loadImpaktfullUiFonts({
  ImpaktfullUiTheme? theme,
  ImpaktfullUiTestFontLoader? fontLoader,
}) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final testFontLoader = fontLoader ?? ImpaktfullUiTestFontLoader();
  final testTheme = theme ?? ImpaktfullUiTheme.getDefault();
  setImpaktfullUiTestTheme(testTheme);
  final textStyles = _getTextStyles(testTheme.textStyles.all);
  for (final textStyle in textStyles) {
    await testFontLoader.loadFontForTextStyle(textStyle);
  }
}

List<TextStyle> _getTextStyles(List<ImpaktfullUiTextStyleTheme> textStyles) {
  final fonts = <TextStyle>{};
  for (final textStyle in textStyles) {
    // display
    fonts.add(textStyle.display.extraLarge2);
    fonts.add(textStyle.display.extraLarge);
    fonts.add(textStyle.display.large);
    fonts.add(textStyle.display.medium);
    fonts.add(textStyle.display.small);
    fonts.add(textStyle.display.extraSmall);
    // text
    fonts.add(textStyle.text.large);
    fonts.add(textStyle.text.medium);
    fonts.add(textStyle.text.small);
    fonts.add(textStyle.text.extraSmall);
  }
  for (final font in fonts.toList()) {
    fonts.add(font.light);
    fonts.add(font.medium);
    fonts.add(font.semiBold);
    fonts.add(font.bold);
  }
  return fonts.toList();
}

class ImpaktfullUiTestFontLoader {
  final fonts = <String>[];
  final loadedFont = <String>[];

  ImpaktfullUiTestFontLoader();

  Future<void> loadFontForTextStyle(TextStyle textStyle) async {
    final font = textStyle.fontFamily?.toLowerCase();
    if (font == null) return;
    var fullPath = 'test/assets/fonts/$font/$font';
    final fontWeight = textStyle.fontWeight;
    if (fontWeight == FontWeight.w300) {
      fullPath += '_light';
    } else if (fontWeight == null || fontWeight == FontWeight.w400) {
      fullPath += '_regular';
    } else if (fontWeight == FontWeight.w500) {
      fullPath += '_medium';
    } else if (fontWeight == FontWeight.w600) {
      fullPath += '_semibold';
    } else if (fontWeight == FontWeight.w700) {
      fullPath += '_bold';
    } else {
      throw Exception('Font weight not supported (create your own font loader ${textStyle.fontWeight})');
    }
    fullPath += '.ttf';
    if (loadedFont.contains(fullPath)) return;
    final fontLoader = FontLoader(font);
    fontLoader.addFont(loadFont(fullPath));
    fontLoader.load();
    loadedFont.add(fullPath);
  }

  Future<ByteData> loadFont(String path) async {
    final file = File(path);
    final bytes = file.readAsBytesSync();
    return ByteData.sublistView(bytes);
  }
}
