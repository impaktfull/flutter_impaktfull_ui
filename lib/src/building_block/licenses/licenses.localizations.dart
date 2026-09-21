import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiBBLicensesLocalizations extends ImpaktfullUiBBLocalizations {
  final String title;
  final String searchTooltip;
  final String searchPlaceholder;
  final String noLicensesFound;

  static ImpaktfullUiBBLicensesLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiBBLicensesLocalizations>(
          context);

  const ImpaktfullUiBBLicensesLocalizations({
    this.title = 'Licenses',
    this.searchTooltip = 'Search',
    this.searchPlaceholder = 'Search for any license',
    this.noLicensesFound = 'No licenses found',
  });

  ImpaktfullUiBBLicensesLocalizations copyWith({
    String? title,
    String? searchTooltip,
    String? searchPlaceholder,
    String? noLicensesFound,
  }) =>
      ImpaktfullUiBBLicensesLocalizations(
        title: title ?? this.title,
        searchTooltip: searchTooltip ?? this.searchTooltip,
        searchPlaceholder: searchPlaceholder ?? this.searchPlaceholder,
        noLicensesFound: noLicensesFound ?? this.noLicensesFound,
      );
}
