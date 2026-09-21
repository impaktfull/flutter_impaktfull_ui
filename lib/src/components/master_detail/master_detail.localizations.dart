import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiMasterDetailLocalizations
    extends ImpaktfullUiComponentLocalizations {
  /// The subtitle when a detail keeps the title of the master, e.g. `Users > John`.
  final String Function(String? title, String subtitle) breadcrumb;

  const ImpaktfullUiMasterDetailLocalizations({
    this.breadcrumb = _defaultBreadcrumb,
  });

  static ImpaktfullUiMasterDetailLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiMasterDetailLocalizations>(
          context);

  ImpaktfullUiMasterDetailLocalizations copyWith({
    String Function(String? title, String subtitle)? breadcrumb,
  }) =>
      ImpaktfullUiMasterDetailLocalizations(
        breadcrumb: breadcrumb ?? this.breadcrumb,
      );
}

String _defaultBreadcrumb(String? title, String subtitle) =>
    '$title > $subtitle';
