import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/formatter/wysiwyg_formatter.dart';

class ImpaktfullUiWysiwygHeaderFormatter extends ImpaktfullUiWysiwygFormatter {
  const ImpaktfullUiWysiwygHeaderFormatter();

  @override
  ImpaktfullUiWysiwygFormatterResult format(
      String text, TextSelection textSelection) {
    return replaceText(
      text: text,
      textSelection: textSelection,
      prefix: '#',
    );
  }
}
