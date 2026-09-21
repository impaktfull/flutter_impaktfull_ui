import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiCmsHeaderLocalizations
    extends ImpaktfullUiComponentLocalizations {
  /// The tooltip of the back button.
  final String backTooltip;

  /// The tooltip of the drawer button while the drawer is closed.
  final String drawerOpenTooltip;

  /// The tooltip of the drawer button while the drawer is open.
  final String drawerCloseTooltip;

  const ImpaktfullUiCmsHeaderLocalizations({
    this.backTooltip = 'Back',
    this.drawerOpenTooltip = 'Open drawer',
    this.drawerCloseTooltip = 'Close drawer',
  });

  static ImpaktfullUiCmsHeaderLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiCmsHeaderLocalizations>(context);

  ImpaktfullUiCmsHeaderLocalizations copyWith({
    String? backTooltip,
    String? drawerOpenTooltip,
    String? drawerCloseTooltip,
  }) =>
      ImpaktfullUiCmsHeaderLocalizations(
        backTooltip: backTooltip ?? this.backTooltip,
        drawerOpenTooltip: drawerOpenTooltip ?? this.drawerOpenTooltip,
        drawerCloseTooltip: drawerCloseTooltip ?? this.drawerCloseTooltip,
      );
}
