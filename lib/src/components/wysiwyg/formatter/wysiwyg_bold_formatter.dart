import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_formatter.dart';

class ImpaktfullUiWysiwygBoldFormatter extends ImpaktfullUiWysiwygFormatter {
  const ImpaktfullUiWysiwygBoldFormatter();

  @override
  ImpaktfullUiWysiwygFormatterResult format(String text, TextSelection textSelection) => replaceText(
        text: text,
        textSelection: textSelection,
        prefix: '**',
        suffix: '**',
      );
}
