import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/global_theme.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

// Deprecated global theme and locale. A global can not follow a theme
// override lower in the tree, and widgets that read it do not rebuild when the
// theme changes. Read the theme from the widget tree instead:
// `ImpaktfullUiTheme.of(context)`. See doc/migrations/1.0.0.md.

@Deprecated(
    'Use ImpaktfullUiTheme.of(context) instead. Will be removed in 1.0.0.')
ImpaktfullUiTheme get theme {
  final testTheme = globalImpaktfullUiTestTheme;
  if (testTheme != null) return testTheme;
  final theme = globalImpaktfullUiTheme;
  if (theme == null) {
    throw Exception(
        'impaktfull theme is not set, make sure you call setImpaktfullTheme() before using theme.');
  }
  return theme;
}

@Deprecated(
    'Use Localizations.localeOf(context) instead. Will be removed in 1.0.0.')
Locale get locale {
  final locale = globalImpaktfullUiLocale;
  if (locale == null) {
    throw Exception(
        'impaktfull locale is not set, make sure you call setImpaktfullLocale() before using theme.');
  }
  return locale;
}

@Deprecated(
    'Pass the theme to ImpaktfullUiApp(impaktfullUiTheme:) and read it with ImpaktfullUiTheme.of(context) instead. Will be removed in 1.0.0.')
void setImpaktfullUiTheme(ImpaktfullUiTheme? theme) =>
    updateGlobalImpaktfullUiTheme(theme);

@Deprecated(
    'Pass the theme to ImpaktfullUiApp(impaktfullUiTheme:) in your test instead. Will be removed in 1.0.0.')
@visibleForTesting
void setImpaktfullUiTestTheme(ImpaktfullUiTheme? theme) {
  globalImpaktfullUiTestTheme = theme;
}

@Deprecated(
    'Pass the locale to ImpaktfullUiApp(locale:) and read it with Localizations.localeOf(context) instead. Will be removed in 1.0.0.')
void setImpaktfullUiLocale(Locale? locale) =>
    updateGlobalImpaktfullUiLocale(locale);
