import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_example/src/example_library/examples/dashboard/src/app.dart';
import 'package:impaktfull_ui_example/src/example_library/config/example_library_item.dart';

class DashboardExample extends ExampleLibraryItem {
  const DashboardExample();

  @override
  String get title => 'Dashboard';

  @override
  Widget build(BuildContext context) => const DashboardExampleApp();
}
