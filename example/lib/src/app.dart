import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';
import 'package:impaktfull_ui_example/src/util/themes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

  static MyAppState of(BuildContext context, {bool useRootNavigator = false}) =>
      context.findRootAncestorStateOfType<MyAppState>()!;
}

class MyAppState extends State<MyApp> {
  ImpaktfullUiTheme? _theme = ExampleThemes.themes.first;
  TargetPlatform? _targetPlatform;

  ImpaktfullUiTheme? get theme => _theme;

  TargetPlatform? get targetPlatform => _targetPlatform;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiApp(
      title: 'impaktfull ui',
      impaktfullUiTheme: _theme,
      targetPlatform: _targetPlatform,
      flavorBannerText: kDebugMode ? null : 'Prod',
      builder: (context, app) => ImpaktfullUiCommandMenu(
        shortcutActivator: const SingleActivator(
          LogicalKeyboardKey.space,
          meta: true,
          control: true,
        ),
        builder: (context, theme, controller) => CommandMenuWindow(
          onCloseWindow: () => controller.hide(),
          onInputChanged: (value) {},
          hasBlurredBackground: true,
        ),
        child: app,
      ),
      navigatorKey: ImpaktfullUiNavigator.instance.navigatorKey,
      initialRoute: ImpaktfullUiNavigator.instance.initialRoute,
      onGenerateRoute: ImpaktfullUiNavigator.instance.onGenerateRoute,
    );
  }

  void setTheme(ImpaktfullUiTheme? theme) {
    if (_theme == theme) return;
    _theme = theme;
    setState(() {});
  }

  void setTargetPlatform(TargetPlatform? targetPlatform) {
    if (_targetPlatform == targetPlatform) return;
    _targetPlatform = targetPlatform;
    setState(() {});
  }
}
