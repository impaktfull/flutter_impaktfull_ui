import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiComponentThemeBuidler<T extends ImpaktfullUiComponentTheme> extends StatelessWidget {
  final T? overrideComponentTheme;
  final Widget Function(BuildContext context, ImpaktfullUiTheme theme, T componentTheme) builder;

  const ImpaktfullUiComponentThemeBuidler({
    required this.builder,
    this.overrideComponentTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ImpaktfullUiTheme.of(context);
    final componentTheme = overrideComponentTheme ?? ImpaktfullUiTheme.getComponentTheme<T>(context);
    return builder(context, theme, componentTheme);
  }
}
