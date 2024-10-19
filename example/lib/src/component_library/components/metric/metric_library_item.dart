import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/metric/metric_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_enum_input.dart';

class MetricLibraryItem extends ComponentLibraryItem {
  const MetricLibraryItem();

  @override
  String get title => 'ImpaktfullUiMetric';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      for (var type in ImpaktfullUiMetricType.values) ...[
        MetricLibraryVariant(
          type: type,
        ),
      ],
    ];
  }
}

class MetricLibraryInputs extends ComponentLibraryInputs {
  final impactType = ComponentLibraryEnumInput(
    'Impact type',
    options: ImpaktfullUiMetricImpactType.values,
    initialValue: ImpaktfullUiMetricImpactType.positive,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        impactType,
      ];
}
