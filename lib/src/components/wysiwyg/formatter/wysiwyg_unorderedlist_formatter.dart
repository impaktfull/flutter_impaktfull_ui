import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_formatter.dart';

class ImpaktfullUiWysiwygUnorderedListFormatter extends ImpaktfullUiWysiwygFormatter {
  const ImpaktfullUiWysiwygUnorderedListFormatter();

  @override
  ImpaktfullUiWysiwygFormatterResult format(String text, TextSelection textSelection) {
    return replaceText(
      text: text,
      textSelection: textSelection,
      prefix: '- ',
    );
  }
}
