import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui_2/src/components/markdown/model/header/header_level.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiMarkDownHeader extends StatelessWidget {
  final String text;
  final ImpaktfullUiMarkDownHeaderLevel level;
  final ImpaktfullUiMarkdownTheme? theme;
  const ImpaktfullUiMarkDownHeader({
    required this.text,
    this.level = ImpaktfullUiMarkDownHeaderLevel.h1,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiMarkdownTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => Text(
        text,
        style: _getTextStyle(componentTheme),
      ),
    );
  }

  TextStyle _getTextStyle(ImpaktfullUiMarkdownTheme componentTheme) {
    switch (level) {
      case ImpaktfullUiMarkDownHeaderLevel.h1:
        return componentTheme.textStyles.h1;
      case ImpaktfullUiMarkDownHeaderLevel.h2:
        return componentTheme.textStyles.h2;
      case ImpaktfullUiMarkDownHeaderLevel.h3:
        return componentTheme.textStyles.h3;
      case ImpaktfullUiMarkDownHeaderLevel.h4:
        return componentTheme.textStyles.h4;
      case ImpaktfullUiMarkDownHeaderLevel.h5:
        return componentTheme.textStyles.h5;
      case ImpaktfullUiMarkDownHeaderLevel.h6:
        return componentTheme.textStyles.h6;
    }
  }
}
