import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiThemeConfigurator extends InheritedWidget {
  final ImpaktfullUiTheme theme;

  ImpaktfullUiThemeConfigurator({
    required this.theme,
    required super.child,
    super.key,
  }) {
    setImpaktfullUiTheme(theme);
  }

  static ImpaktfullUiThemeConfigurator of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<ImpaktfullUiThemeConfigurator>()!;

  @override
  bool updateShouldNotify(covariant ImpaktfullUiThemeConfigurator oldWidget) {
    final shouldUpdate = theme != oldWidget.theme;
    if (shouldUpdate) {
      setImpaktfullUiTheme(theme);
    }
    return shouldUpdate;
  }
}
