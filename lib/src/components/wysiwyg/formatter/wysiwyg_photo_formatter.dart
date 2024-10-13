import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/formatter/wysiwyg_formatter.dart';

class ImpaktfullUiWysiwygPhotoFormatter extends ImpaktfullUiWysiwygFormatter {
  static const supportedExtensions = [
    '.svg',
    '.jpeg',
    '.jpg',
    '.png',
    '.gif',
    '.webp',
  ];
  const ImpaktfullUiWysiwygPhotoFormatter();

  @override
  ImpaktfullUiWysiwygFormatterResult format(
      String text, TextSelection? textSelection) {
    if (textSelection == null) {
      return ImpaktfullUiWysiwygFormatterResult(
        text: text,
        textSelection: textSelection,
      );
    }
    final selectedText = getSelectedText(text, textSelection);
    if (selectedText.toLowerCase().startsWith('assets/')) {
      return replaceText(
        text: text,
        textSelection: textSelection,
        prefix: '![text](',
        suffix: ')',
      );
    } else if (supportedExtensions
        .any((ext) => selectedText.toLowerCase().endsWith(ext))) {
      return replaceText(
        text: text,
        textSelection: textSelection,
        prefix: '![text](',
        suffix: ')',
      );
    }
    final hintText = selectedText.isEmpty ? 'text' : '';
    return replaceText(
      text: text,
      textSelection: textSelection,
      prefix: '![$hintText',
      suffix: '](url)',
    );
  }
}
