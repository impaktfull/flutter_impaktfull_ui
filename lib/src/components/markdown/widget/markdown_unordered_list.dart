import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiMarkDownUnorderedList extends StatelessWidget {
  final String text;
  final int indent;
  final ImpaktfullUiMarkdownTheme? theme;

  const ImpaktfullUiMarkDownUnorderedList({
    required this.text,
    this.indent = 0,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiMarkdownTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        return Padding(
          padding: EdgeInsets.only(left: indent * 16),
          child: RichText(
            text: TextSpan(
              style: componentTheme.textStyles.unorderedList,
              children: [
                WidgetSpan(
                  child: ImpaktfullUiAssetWidget(
                    asset: componentTheme.assets.unorderedListBullet,
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
                TextSpan(text: text),
              ],
            ),
          ),
        );
      },
    );
  }
}
