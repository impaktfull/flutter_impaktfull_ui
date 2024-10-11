import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/wysiwyg/wysiwyg.dart';

class WysiwygPreview extends StatelessWidget {
  final String text;
  final ImpaktfullUiWysiwygType type;
  final ImpaktfullUiWysiwygTheme componentTheme;
  const WysiwygPreview({
    required this.text,
    required this.type,
    required this.componentTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        text,
        style: componentTheme.textStyles.previewText,
      ),
    );
  }
}
