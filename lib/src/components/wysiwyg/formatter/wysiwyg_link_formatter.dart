import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_formatter.dart';

class ImpaktfullUiWysiwygLinkFormatter extends ImpaktfullUiWysiwygFormatter {
  const ImpaktfullUiWysiwygLinkFormatter();

  @override
  ImpaktfullUiWysiwygFormatterResult format(String text, TextSelection textSelection) {
    final selectedText = getSelectedText(text, textSelection);
    if (selectedText.toLowerCase().startsWith('http')) {
      return replaceText(
        text: text,
        textSelection: textSelection,
        prefix: '[text](',
        suffix: ')',
      );
    }
    final hintText = selectedText.isEmpty ? 'text' : '';
    return replaceText(
      text: text,
      textSelection: textSelection,
      prefix: '[$hintText',
      suffix: '](url)',
    );
  }
}
