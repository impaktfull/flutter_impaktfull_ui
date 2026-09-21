import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiBBNotFoundLocalizations extends ImpaktfullUiBBLocalizations {
  final String title;
  final String subtitle;

  static ImpaktfullUiBBNotFoundLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiBBNotFoundLocalizations>(
          context);

  const ImpaktfullUiBBNotFoundLocalizations({
    this.title = 'Page not found',
    this.subtitle = 'We were not able to find this page',
  });

  ImpaktfullUiBBNotFoundLocalizations copyWith({
    String? title,
    String? subtitle,
  }) =>
      ImpaktfullUiBBNotFoundLocalizations(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
      );
}
