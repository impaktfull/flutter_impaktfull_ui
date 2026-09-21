import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiOptionSelectorLocalizations
    extends ImpaktfullUiComponentLocalizations {
  /// Shown when there are no options.
  final String noOptions;

  const ImpaktfullUiOptionSelectorLocalizations({
    this.noOptions = 'No options',
  });

  static ImpaktfullUiOptionSelectorLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiOptionSelectorLocalizations>(
          context);

  ImpaktfullUiOptionSelectorLocalizations copyWith({
    String? noOptions,
  }) =>
      ImpaktfullUiOptionSelectorLocalizations(
        noOptions: noOptions ?? this.noOptions,
      );
}
