import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/screen/home/home_screen.dart';
import 'package:impaktfull_ui_example/src/widget/theme/theme_button.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

  static MyAppState of(BuildContext context, {bool useRootNavigator = false}) =>
      context.findRootAncestorStateOfType<MyAppState>()!;
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiApp(
      title: 'impaktfull ui',
      impaktfullUiTheme: ThemeButton.activeTheme,
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
      // const is disabled here because it would not rebuild when the theme is set again.
      // ignore: prefer_const_constructors
      home: HomeScreen(),
    );
  }

  void refresh() => setState(() {});
}
