import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiBBLicenseLocalizations extends ImpaktfullUiBBLocalizations {
  final String title;
  final String searchTooltip;
  final String searchPlaceholder;
  final String noLicensesFound;

  static ImpaktfullUiBBLicenseLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of(context);

  const ImpaktfullUiBBLicenseLocalizations({
    this.title = 'Licenses',
    this.searchTooltip = 'Search',
    this.searchPlaceholder = 'Search for any license',
    this.noLicensesFound = 'No licenses found',
  });
}
