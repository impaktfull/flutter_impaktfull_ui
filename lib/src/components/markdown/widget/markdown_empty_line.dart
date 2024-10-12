import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';

class ImpaktfullUiMarkDownEmptyLine extends StatelessWidget {
  final ImpaktfullUiMarkdownTheme? theme;
  const ImpaktfullUiMarkDownEmptyLine({
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 8);
  }
}
