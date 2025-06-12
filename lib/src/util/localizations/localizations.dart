import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/localization/localization_configurator.dart';

abstract class ImpaktfullUiCoreLocalizations {
  const ImpaktfullUiCoreLocalizations();
}

abstract class ImpaktfullUiComponentLocalizations
    extends ImpaktfullUiCoreLocalizations {
  const ImpaktfullUiComponentLocalizations();
}

abstract class ImpaktfullUiBBLocalizations
    extends ImpaktfullUiCoreLocalizations {
  const ImpaktfullUiBBLocalizations();
}

class ImpaktfullUiLocalizations {
  final ImpaktfullUiBBLoginLocalizations bbLogin;
  final ImpaktfullUiBBLicenseLocalizations bbLicenses;
  final ImpaktfullUiNavBarLocalizations navBar;
  final ImpaktfullUiListViewLocalizations listView;

  const ImpaktfullUiLocalizations({
    this.bbLogin = const ImpaktfullUiBBLoginLocalizations(),
    this.bbLicenses = const ImpaktfullUiBBLicenseLocalizations(),
    this.navBar = const ImpaktfullUiNavBarLocalizations(),
    this.listView = const ImpaktfullUiListViewLocalizations(),
  });

  static T of<T extends ImpaktfullUiCoreLocalizations>(BuildContext context) {
    final localization =
        ImpaktfullUiLocalizationConfigurator.of(context).localizations;
    if (T == ImpaktfullUiNavBarLocalizations) {
      return localization.navBar as T;
    } else if (T == ImpaktfullUiBBLoginLocalizations) {
      return localization.bbLogin as T;
    } else if (T == ImpaktfullUiBBLicenseLocalizations) {
      return localization.bbLicenses as T;
    } else if (T == ImpaktfullUiListViewLocalizations) {
      return localization.listView as T;
    } else {
      throw Exception('Localization $T not found');
    }
  }
}
