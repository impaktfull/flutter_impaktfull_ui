import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiMarkDownOrderedList extends StatelessWidget {
  final String text;
  final int number;
  final int indent;
  final ImpaktfullUiMarkdownTheme? theme;

  const ImpaktfullUiMarkDownOrderedList({
    required this.text,
    required this.number,
    required this.indent,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiMarkdownTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Padding(
        padding: EdgeInsets.only(left: 12 + (indent * 16)),
        child: RichText(
          text: TextSpan(
            style: componentTheme.textStyles.orderedList,
            children: [
              TextSpan(
                text: '$number.',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const WidgetSpan(child: SizedBox(width: 8)),
              TextSpan(text: text),
            ],
          ),
        ),
      ),
    );
  }
}
