import 'package:impaktfull_ui_example/src/examples_library/config/example_library_item.dart';
import 'package:impaktfull_ui_example/src/examples_library/examples/dashboard/dashboard_example.dart';

class ExampleLibrary {
  static ExampleLibrary? _instance;

  ExampleLibrary._();

  static ExampleLibrary get instance => _instance ??= ExampleLibrary._();

  final List<ExampleLibraryItem> examples = [
    const DashboardExample(),
  ];
}
