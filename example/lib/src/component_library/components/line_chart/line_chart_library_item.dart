import 'package:impaktfull_ui_example/src/component_library/components/line_chart/line_chart_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class LineChartLibraryItem extends ComponentLibraryItem {
  const LineChartLibraryItem();

  @override
  String get title => 'ImpaktfullUiLineChart';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const LineChartLibraryVariant(),
    ];
  }
}

class LineChartLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
