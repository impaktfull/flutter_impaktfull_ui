import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiMarkDownPragraph extends StatelessWidget {
  final String text;
  final ImpaktfullUiMarkdownTheme? theme;

  const ImpaktfullUiMarkDownPragraph({
    required this.text,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiMarkdownTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Text(
        text,
        style: componentTheme.textStyles.paragraph,
      ),
    );
  }
}
