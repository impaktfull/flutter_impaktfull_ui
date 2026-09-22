import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/global_theme.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiThemeConfigurator extends InheritedWidget {
  final ImpaktfullUiTheme theme;

  ImpaktfullUiThemeConfigurator({
    required this.theme,
    required super.child,
    super.key,
  }) {
    // Keeps the deprecated global `theme` getter working until 1.0.0.
    updateGlobalImpaktfullUiTheme(theme);
  }

  static ImpaktfullUiThemeConfigurator of(BuildContext context) =>
      maybeOf(context)!;

  static ImpaktfullUiThemeConfigurator? maybeOf(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<ImpaktfullUiThemeConfigurator>();

  @override
  bool updateShouldNotify(covariant ImpaktfullUiThemeConfigurator oldWidget) {
    final shouldUpdate = theme != oldWidget.theme;
    if (shouldUpdate) {
      updateGlobalImpaktfullUiTheme(theme);
    }
    return shouldUpdate;
  }
}
