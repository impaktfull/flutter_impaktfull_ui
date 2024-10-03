import 'package:flutter/material.dart';
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
      // const is disabled here because it would not rebuild when the theme is set again.
      // ignore: prefer_const_constructors
      home: HomeScreen(),
    );
  }

  void refresh() => setState(() {});
}
