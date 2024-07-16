import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

export 'table_header_item_style.dart';

class ImpaktfullUiTableHeaderItem extends StatelessWidget {
  final String title;
  final ImpaktfullUiTableHeaderItemTheme? theme;

  const ImpaktfullUiTableHeaderItem({
    required this.title,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiTableHeaderItemTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => Text(
        title,
        style: componentTheme.textStyles.title,
      ),
    );
  }
}
