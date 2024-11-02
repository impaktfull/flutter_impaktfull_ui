import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiComponentThemeBuidler<T extends ImpaktfullUiComponentTheme> extends StatelessWidget {
  final T? overrideComponentTheme;
  final Widget Function(BuildContext context, T componentTheme) builder;

  const ImpaktfullUiComponentThemeBuidler({
    required this.builder,
    this.overrideComponentTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final componentTheme = overrideComponentTheme ?? ImpaktfullUiComponentsTheme.of<T>(context);
    return builder(context, componentTheme);
  }
}
