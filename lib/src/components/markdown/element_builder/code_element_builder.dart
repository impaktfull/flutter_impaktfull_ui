import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';
// ignore: depend_on_referenced_packages
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_markdown/flutter_markdown.dart';

class ImpaktfullUiMarkdownCodeElementBuilder extends MarkdownElementBuilder {
  final ImpaktfullUiMarkdownTheme theme;

  ImpaktfullUiMarkdownCodeElementBuilder({
    required this.theme,
  });

  @override
  Widget visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    final isMultiLine = element.textContent.split('\n').length > 1;
    return Container(
      padding: isMultiLine
          ? const EdgeInsets.all(8)
          : const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: theme.colors.code,
        borderRadius: theme.dimens.code,
      ),
      width: isMultiLine ? double.infinity : null,
      child: Text(
        element.textContent.trim(),
        style: theme.textStyles.code,
      ),
    );
  }
}
