import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

ImpaktfullUiTheme? _theme;
ImpaktfullUiTheme? _testTheme;
Locale? _locale;

ImpaktfullUiTheme get theme {
  if (_testTheme != null) return _testTheme!;
  if (_theme == null) {
    throw Exception(
        'impaktfull theme is not set, make sure you call setImpaktfullTheme() before using theme.');
  }
  return _theme!;
}

Locale get locale {
  if (_locale == null) {
    throw Exception(
        'impaktfull locale is not set, make sure you call setImpaktfullLocale() before using theme.');
  }
  return _locale!;
}

void setImpaktfullUiTheme(ImpaktfullUiTheme? theme) {
  if (_testTheme != null) return;
  _theme = theme ?? ImpaktfullUiTheme.getDefault();
}

@visibleForTesting
void setImpaktfullUiTestTheme(ImpaktfullUiTheme? theme) {
  _testTheme = theme;
}

void setImpaktfullUiLocale(Locale? locale) {
  _locale = locale ?? const Locale('en');
}
