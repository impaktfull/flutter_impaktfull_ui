import 'package:flutter/widgets.dart';

/// Which of the themes of `ImpaktfullUiApp` is used, like `ThemeMode` of a
/// `MaterialApp`.
enum ImpaktfullUiThemeMode {
  /// Follows the brightness of the platform
  /// ([MediaQueryData.platformBrightness]): the dark theme when the platform
  /// is dark, the light theme otherwise.
  system,

  /// Always the light theme (`ImpaktfullUiApp.impaktfullUiTheme`).
  light,

  /// Always the dark theme (`ImpaktfullUiApp.impaktfullUiDarkTheme`), or the
  /// light theme when there is no dark theme.
  dark;

  /// The [Brightness] of this mode, for [system] the brightness of [context].
  Brightness resolve(BuildContext context) => switch (this) {
        ImpaktfullUiThemeMode.system =>
          MediaQuery.platformBrightnessOf(context),
        ImpaktfullUiThemeMode.light => Brightness.light,
        ImpaktfullUiThemeMode.dark => Brightness.dark,
      };
}
