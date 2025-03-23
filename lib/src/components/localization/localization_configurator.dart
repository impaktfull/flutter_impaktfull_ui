import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiLocalizationConfigurator extends InheritedWidget {
  final ImpaktfullUiLocalizations localizations;

  const ImpaktfullUiLocalizationConfigurator({
    required this.localizations,
    required super.child,
    super.key,
  });

  static ImpaktfullUiLocalizationConfigurator of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<
          ImpaktfullUiLocalizationConfigurator>()!;

  @override
  bool updateShouldNotify(
          covariant ImpaktfullUiLocalizationConfigurator oldWidget) =>
      localizations != oldWidget.localizations;
}
