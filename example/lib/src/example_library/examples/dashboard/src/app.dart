import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/example_library/examples/dashboard/src/screen/dashboard_base_screen.dart';

class DashboardExampleApp extends StatelessWidget {
  const DashboardExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiApp(
      title: 'Dashboard examples',
      impaktfullUiTheme: ImpaktfullUiTheme.getDefault(
        package: null,
      ),
      home: const DashboardBaseScreen(),
    );
  }
}
