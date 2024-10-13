import 'package:flutter/widgets.dart';

class ImpaktfullUiWysiwygFormatterResult {
  final String text;
  final TextSelection? textSelection;

  ImpaktfullUiWysiwygFormatterResult({
    required this.text,
    required this.textSelection,
  });
}

abstract class ImpaktfullUiWysiwygFormatter {
  const ImpaktfullUiWysiwygFormatter();

  ImpaktfullUiWysiwygFormatterResult format(
      String text, TextSelection? textSelection);
  @protected
  ImpaktfullUiWysiwygFormatterResult replaceText({
    required String text,
    required TextSelection? textSelection,
    required String prefix,
    String? suffix,
  }) {
    if (textSelection == null) {
      return ImpaktfullUiWysiwygFormatterResult(
        text: text,
        textSelection: textSelection,
      );
    }
    final selectedText = getSelectedText(text, textSelection);
    final effectiveSuffix = suffix ?? '';

    String newText;
    TextSelection newSelection;
    // Check if prefix and suffix are already added before the selected text
    final beforeSelection = text.substring(0, textSelection.start);
    final afterSelection = text.substring(textSelection.end);
    final isPrefixAdded = beforeSelection.endsWith(prefix);
    final isSuffixAdded =
        suffix != null && afterSelection.startsWith(effectiveSuffix);

    if (isPrefixAdded && isSuffixAdded) {
      // Remove prefix and suffix if they are already added
      newText = text.replaceRange(
        textSelection.start - prefix.length,
        textSelection.end + effectiveSuffix.length,
        selectedText,
      );
      newSelection = TextSelection(
        baseOffset: textSelection.start - prefix.length,
        extentOffset: textSelection.end - prefix.length,
      );
    } else if (selectedText.startsWith(prefix) &&
        (suffix == null || selectedText.endsWith(effectiveSuffix))) {
      // Remove prefix and suffix if they are within the selected text
      newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        selectedText.substring(
            prefix.length, selectedText.length - effectiveSuffix.length),
      );
      newSelection = TextSelection(
        baseOffset: textSelection.start,
        extentOffset:
            textSelection.end - prefix.length - effectiveSuffix.length,
      );
    } else {
      // Add prefix and suffix
      newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '$prefix$selectedText$effectiveSuffix',
      );
      final baseOffset = textSelection.start + prefix.length;
      newSelection = TextSelection(
        baseOffset: baseOffset,
        extentOffset: baseOffset + selectedText.length,
      );
    }

    return ImpaktfullUiWysiwygFormatterResult(
      text: newText,
      textSelection: newSelection,
    );
  }

  @protected
  String getSelectedText(String text, TextSelection textSelection) {
    return text.substring(
      textSelection.start,
      textSelection.end,
    );
  }
}
