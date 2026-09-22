import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

// The last theme and locale set by ImpaktfullUiThemeConfigurator and
// ImpaktfullUiApp. Only the deprecated global getters of
// theme_configurator.dart read them: components always use
// `ImpaktfullUiTheme.of(context)`, so they follow theme overrides and rebuild
// when the theme changes.
//
// Not exported. Removed in 1.0.0, together with the deprecated getters.

ImpaktfullUiTheme? globalImpaktfullUiTheme;
ImpaktfullUiTheme? globalImpaktfullUiTestTheme;
Locale? globalImpaktfullUiLocale;

void updateGlobalImpaktfullUiTheme(ImpaktfullUiTheme? theme) {
  if (globalImpaktfullUiTestTheme != null) return;
  globalImpaktfullUiTheme = theme ?? ImpaktfullUiTheme.getDefault();
}

void updateGlobalImpaktfullUiLocale(Locale? locale) {
  globalImpaktfullUiLocale = locale ?? const Locale('en');
}
