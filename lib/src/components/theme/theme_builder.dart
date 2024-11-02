import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiThemeBuidler extends StatelessWidget {
  final Widget Function(BuildContext context, ImpaktfullUiTheme theme) builder;
  const ImpaktfullUiThemeBuidler({
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ImpaktfullUiTheme.of(context);
    return builder(context, theme);
  }
}
