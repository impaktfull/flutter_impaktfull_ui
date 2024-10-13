import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/wysiwyg.dart';

class WysiwygPreview extends StatelessWidget {
  final String text;
  final ImpaktfullUiWysiwygType type;
  const WysiwygPreview({
    required this.text,
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ImpaktfullUiWysiwygType.markdown:
        return ImpaktfullUiMarkdown(
          data: text,
        );
    }
  }
}
