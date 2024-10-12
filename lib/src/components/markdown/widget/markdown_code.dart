import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiMarkDownCode extends StatelessWidget {
  final String text;
  final ImpaktfullUiMarkdownTheme? theme;
  const ImpaktfullUiMarkDownCode({
    required this.text,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiMarkdownTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Container(
        decoration: BoxDecoration(
          color: componentTheme.colors.code,
          borderRadius: componentTheme.dimens.code,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          text,
          style: componentTheme.textStyles.code,
        ),
      ),
    );
  }
}
