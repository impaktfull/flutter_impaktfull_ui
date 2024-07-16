import 'package:flutter/material.dart';
import 'package:impaktfull_ui_example/src/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'impaktfull ui',
      home: HomeScreen(),
    );
  }
}
