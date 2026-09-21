import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiNavBarLocalizations
    extends ImpaktfullUiComponentLocalizations {
  final String backTooltip;
  final String closeTooltip;
  final String drawerOpenTooltip;
  final String drawerCloseTooltip;

  static ImpaktfullUiNavBarLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of(context);

  const ImpaktfullUiNavBarLocalizations({
    this.backTooltip = 'Back',
    this.closeTooltip = 'Close',
    this.drawerOpenTooltip = 'Open Drawer',
    this.drawerCloseTooltip = 'Close Drawer',
  });

  ImpaktfullUiNavBarLocalizations copyWith({
    String? backTooltip,
    String? closeTooltip,
    String? drawerOpenTooltip,
    String? drawerCloseTooltip,
  }) =>
      ImpaktfullUiNavBarLocalizations(
        backTooltip: backTooltip ?? this.backTooltip,
        closeTooltip: closeTooltip ?? this.closeTooltip,
        drawerOpenTooltip: drawerOpenTooltip ?? this.drawerOpenTooltip,
        drawerCloseTooltip: drawerCloseTooltip ?? this.drawerCloseTooltip,
      );
}
