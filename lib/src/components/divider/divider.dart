import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';

export 'divider_style.dart';

class ImpaktfullUiDivider extends StatelessWidget {
  final ImpaktfullUiDividerTheme? theme;

  const ImpaktfullUiDivider({
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiDividerTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) => Container(
        color: componentTheme.colors.color,
        width: double.infinity,
        height: 1,
      ),
    );
  }
}
