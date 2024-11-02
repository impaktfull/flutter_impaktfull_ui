import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_formatter.dart';

class ImpaktfullUiWysiwygItalicFormatter extends ImpaktfullUiWysiwygFormatter {
  const ImpaktfullUiWysiwygItalicFormatter();

  @override
  ImpaktfullUiWysiwygFormatterResult format(String text, TextSelection textSelection) => replaceText(
        text: text,
        textSelection: textSelection,
        prefix: '_',
        suffix: '_',
      );
}
