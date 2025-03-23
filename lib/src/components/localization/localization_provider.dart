import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiLocalizationProvider<T extends ImpaktfullUiCoreLocalizations>
    extends StatelessWidget {
  final T? localizations;
  final Widget Function(BuildContext context, T localizations) builder;
  const ImpaktfullUiLocalizationProvider({
    required this.localizations,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localizations =
        this.localizations ?? ImpaktfullUiLocalizations.of<T>(context);
    return builder(context, localizations);
  }
}
