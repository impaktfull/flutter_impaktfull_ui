import 'dart:ui';

import 'package:impaktfull_ui_2/src/theme/theme.dart';

ImpaktfullUiTheme? _theme;
Locale? _locale;

ImpaktfullUiTheme get theme {
  if (_theme == null) {
    throw Exception(
        'Impaktfull theme is not set, make sure you call setImpaktfullTheme() before using theme.');
  }
  return _theme!;
}

Locale get locale {
  if (_locale == null) {
    throw Exception(
        'Impaktfull locale is not set, make sure you call setImpaktfullLocale() before using theme.');
  }
  return _locale!;
}

void setImpaktfullUiTheme(ImpaktfullUiTheme? theme) {
  _theme = theme ?? ImpaktfullUiTheme.getDefault();
}

void setImpaktfullUiLocale(Locale? locale) {
  _locale = locale ?? const Locale('en');
}
