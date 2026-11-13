import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import 'test_file/test_file.dart';

/// Loads the fonts of [theme] (the default theme without one).
///
/// Call it from `setUpAll` or `setUp`, never from the body of a `testWidgets`.
/// A loaded font makes the engine send a `fontsChange` message, which is
/// handled outside the fake async zone of the test body: only after the body
/// has finished. Every attached text then schedules a frame callback that no
/// pump runs anymore, and the test fails with "An animation is still running
/// even after the widget tree was disposed" (Flutter 3.50 and later).
Future<void> loadImpaktfullUiFonts({
  ImpaktfullUiTheme? theme,
  ImpaktfullUiTestFontLoader? fontLoader,
}) async {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  if (binding.inTest) {
    throw StateError(
      'loadImpaktfullUiFonts() was called inside a testWidgets body. Call it '
      'from setUpAll or setUp instead: the fontsChange message of a font that '
      'is loaded during a widget test only arrives after the test has ended.',
    );
  }
  final testFontLoader = fontLoader ?? ImpaktfullUiTestFontLoader();
  final testTheme = theme ?? ImpaktfullUiTheme.getDefault();
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
    fonts.add(font.copyWith(fontWeight: FontWeight.w300));
    fonts.add(font.copyWith(fontWeight: FontWeight.w500));
    fonts.add(font.copyWith(fontWeight: FontWeight.w600));
    fonts.add(font.copyWith(fontWeight: FontWeight.w700));
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
      throw Exception(
          'Font weight not supported (create your own font loader ${textStyle.fontWeight})');
    }
    fullPath += '.ttf';
    if (loadedFont.contains(fullPath)) return;
    final fontLoader = FontLoader(font);
    fontLoader.addFont(loadFont(fullPath));
    await fontLoader.load();
    loadedFont.add(fullPath);
  }

  Future<ByteData> loadFont(String path) async {
    // dart:io on the VM, a fetch from the test server in Chrome
    final bytes = readTestFile(path);
    return ByteData.sublistView(bytes);
  }
}
